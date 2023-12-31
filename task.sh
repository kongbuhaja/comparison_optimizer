start_background_task() {
    nohup python3 "$1".py --model ResNet18 --channel 16 --eval_term 5 --dataset "$3" --optimizer "$2" --load True --epochs 10000 > "$2.log" 2>&1 &
}

wait_for_completion() {
    while pgrep -f "python3 $1.py --model ResNet18 --channel 16 --eval_term 5 --dataset $3 --optimizer $2 --load True --epochs 10000" > /dev/null; do
        sleep 1
    done
}

task() {
    start_background_task "$1" "$2" "$3"
    wait_for_completion "$1" "$2" "$3"
}

# task train SGD cifar100
# task train Momentum cifar100
# task train Adam cifar100
# task train Adadelta cifar100
# task train Adagrad cifar100
# task train AdamW cifar100
# task train NAdam cifar100
# task train RAdam cifar100
# task train RMSprop cifar100
# task train Rprop cifar100

task val SGD cifar100
task val Momentum cifar100
task val Adam cifar100
task val Adadelta cifar100
task val Adagrad cifar100