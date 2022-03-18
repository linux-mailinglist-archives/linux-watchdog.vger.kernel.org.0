Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B16A84DD6C8
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Mar 2022 10:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbiCRJFK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Mar 2022 05:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234183AbiCRJFI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Mar 2022 05:05:08 -0400
X-Greylist: delayed 907 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Mar 2022 02:03:48 PDT
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5AF5916F075;
        Fri, 18 Mar 2022 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=660BW
        LBIIzM5W4PcDpTZNYhr9l/nNHPep5ELM8beyAQ=; b=hn+6FUX83jIVWKgqlJaDx
        wROT1VoSkRys2x+7jEshgQQGLom9pWxhOMeA3U47dN5/lWiGwisILzNFQ+fBtufi
        ABa3uDn96s+VJriAdU8F4RIkKy2cg9WtHZOArOabu4bQc+fRrkSwsPsyx/zVm1e9
        1NUXCOio2qqJXhamZF/PVg=
Received: from [172.20.10.3] (unknown [112.224.136.231])
        by smtp5 (Coremail) with SMTP id HdxpCgB3lcVNRzRi0tYdHA--.26639S2;
        Fri, 18 Mar 2022 16:48:15 +0800 (CST)
Message-ID: <3dcacbaa-19e0-9ee3-8003-846105b3d4a7@163.com>
Date:   Fri, 18 Mar 2022 16:48:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: dev_WARN_ONCE cause gpio-watchdog reset
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        Bin Liu <b-liu@ti.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <8cea8d54-bd3c-5892-96d3-4d16e07ba457@163.com>
 <fabca0f0-c901-9cb0-a8ca-974604491d1b@163.com>
 <a26854ea42224032aec6758ae7444dc8@SVR-IES-MBX-03.mgc.mentorg.com>
From:   qianfan <qianfanguijin@163.com>
In-Reply-To: <a26854ea42224032aec6758ae7444dc8@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgB3lcVNRzRi0tYdHA--.26639S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfJFy5WFykCr4kXrWDJF13urg_yoW8Gr1Uuo
        Wxu3W29a18KFn8G3WfAwsrJw15Grn7Gay7tr45Gw4UXFZrZrZ8XryFy3s8WayYqa98WFs3
        Aw45twn5Kw13Kr4kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnvtCDUUUU
X-Originating-IP: [112.224.136.231]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbCqRvH7V0DeRjhjgAAsI
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


在 2022/3/18 16:38, Schmid, Carsten 写道:
> Hi Qianfan,
>
> do you have a serial console connected where the dmesg is sent to?
> Be aware that in such a case, at 115kBaud, 1 ms is needed to
> print 10 characters.
> When i look at the timestamps between two lines of the stack dump,
> i can see that ~10ms are needed to print one line which means 100 chars.
> Thats reasonable.

Thanks for yours replay. Yes, there has a serial console work in 
115200bps but I had found it is not the cause of the problem. I had send 
another email with a picture seems failed. Let me paste the text of that 
email:

I had changed the "hw_margin_ms" to "200" (so that gpio-wdt.c toggle pin 
every 100ms), remove dev_WARN_ONCE message and sniffer uart console and 
gpio watchdog signal.

watchdog should toggle gpio every 100ms, but it delayed more than 1s 
after kernel print "unregister 'rndis_host' usb-musb-hdrc.0-1, RNDIS 
device", after that gpio-wdt work again. Next is the console logs:

[  491.593980] usb 1-1: new full-speed USB device number 7 using musb-hdrc
[  491.774272] usb 1-1: not running at top speed; connect to a high 
speed hub
[  491.785749] usb 1-1: New USB device found, idVendor=0451, 
idProduct=6141, bcdDevice= 0.00
[  491.794469] usb 1-1: New USB device strings: Mfr=33, Product=37, 
SerialNumber=0
[  491.802167] usb 1-1: Product: AM335x USB
[  491.806327] usb 1-1: Manufacturer: Texas Instruments
[  491.858139] rndis_host 1-1:1.0 usb0: register 'rndis_host' at 
usb-musb-hdrc.0-1, RNDIS device, 8a:25:2a:15:03:45
[  496.031464] musb-hdrc musb-hdrc.0: ep11 RX three-strikes error
[  498.041123] usb 1-1: USB disconnect, device number 7
[  498.046691] rndis_host 1-1:1.0 usb0: unregister 'rndis_host' 
usb-musb-hdrc.0-1, RNDIS device

AM335X's USB doesn't work again after 'RX three-strikes error' but it 
can enum device successful.

[ 9438.753947] usb 1-1: new full-speed USB device number 10 using musb-hdrc
[ 9438.934240] usb 1-1: not running at top speed; connect to a high 
speed hub
[ 9438.942467] usb 1-1: New USB device found, idVendor=0451, 
idProduct=6141, bcdDevice= 0.00
[ 9438.951130] usb 1-1: New USB device strings: Mfr=33, Product=37, 
SerialNumber=0
[ 9438.958847] usb 1-1: Product: AM335x USB
[ 9438.962973] usb 1-1: Manufacturer: Texas Instruments
[ 9439.014957] rndis_host 1-1:1.0 usb0: register 'rndis_host' at 
usb-musb-hdrc.0-1, RNDIS device, ee:2e:c1:14:d6:3d
[ 9443.189848] musb-hdrc musb-hdrc.0: ep11 RX three-strikes error
[ 9445.195341] usb 1-1: USB disconnect, device number 10
[ 9445.200985] rndis_host 1-1:1.0 usb0: unregister 'rndis_host' 
usb-musb-hdrc.0-1, RNDIS device
[ 9453.833951] usb 1-1: new full-speed USB device number 11 using musb-hdrc
[ 9454.014192] usb 1-1: not running at top speed; connect to a high 
speed hub
[ 9454.022270] usb 1-1: New USB device found, idVendor=0451, 
idProduct=6141, bcdDevice= 0.00
[ 9454.030963] usb 1-1: New USB device strings: Mfr=33, Product=37, 
SerialNumber=0
[ 9454.038664] usb 1-1: Product: AM335x USB
[ 9454.042788] usb 1-1: Manufacturer: Texas Instruments
[ 9454.094669] rndis_host 1-1:1.0 usb0: register 'rndis_host' at 
usb-musb-hdrc.0-1, RNDIS device, c2:73:62:68:c9:92
[ 9458.269536] musb-hdrc musb-hdrc.0: ep11 RX three-strikes error
[ 9460.275036] usb 1-1: USB disconnect, device number 11
[ 9460.280671] rndis_host 1-1:1.0 usb0: unregister 'rndis_host' 
usb-musb-hdrc.0-1, RNDIS device

So I think it's a bug of MUSB, not caused by dev_WARN_ONCE. But I can't 
check which stop hrtimer.
>
> I hit that pitfall in the past multiple times ....
>
> Best regards
> Carsten
>
> -----Original Message-----
> From: qianfan <qianfanguijin@163.com>
> Sent: Freitag, 18. März 2022 03:08
> To: Bin Liu <b-liu@ti.com>; Wim Van Sebroeck <wim@linux-watchdog.org>; Guenter Roeck <linux@roeck-us.net>
> Cc: linux-usb@vger.kernel.org; linux-watchdog@vger.kernel.org
> Subject: Re: dev_WARN_ONCE cause gpio-watchdog reset
>
>
> 在 2022/3/18 8:44, qianfan 写道:
>> Hi:
>>
>> I have a custom AM3352 board with linux v5.15 support. I had enabled
>> gpio-watchdog driver and the timeout of gpio-watchdog is 1.6s .
>>
>> The system will reboot when AM3352's MUSB driver print warn message:
>> (next is the log)
>>
>> [ 1555.665496] ------------[ cut here ]------------
>> [ 1555.670343] WARNING: CPU: 0 PID: 345 at
>> drivers/usb/musb/musb_host.c:115 musb_h_tx_flush_fifo+0x11c/0x13c
>> [ 1555.680395] musb-hdrc musb-hdrc.0: Could not flush host TX10 fifo:
>> csr: 2403
>> [ 1555.687779] Modules linked in:
>> [ 1555.690989] CPU: 0 PID: 345 Comm: kworker/0:1 Not tainted
>> 5.15.0-00013-g0ccd7df8f5ad #122
>> [ 1555.699560] Hardware name: Generic AM33XX (Flattened Device Tree)
>> [ 1555.705946] Workqueue: usb_hub_wq hub_event
>> [ 1555.710359] [<c0111438>] (unwind_backtrace) from [<c010b9f4>]
>> (show_stack+0x10/0x14)
>> [ 1555.718497] [<c010b9f4>] (show_stack) from [<c0adc24c>]
>> (dump_stack_lvl+0x40/0x4c)
>> [ 1555.726453] [<c0adc24c>] (dump_stack_lvl) from [<c0136264>]
>> (__warn+0xf0/0x104)
>> [ 1555.734126] [<c0136264>] (__warn) from [<c01362ec>]
>> (warn_slowpath_fmt+0x74/0xbc)
>> [ 1555.741973] [<c01362ec>] (warn_slowpath_fmt) from [<c07e8b40>]
>> (musb_h_tx_flush_fifo+0x11c/0x13c)
>> [ 1555.751280] [<c07e8b40>] (musb_h_tx_flush_fifo) from [<c07ea024>]
>> (musb_cleanup_urb+0x128/0x204)
>> [ 1555.760495] [<c07ea024>] (musb_cleanup_urb) from [<c07ea1e4>]
>> (musb_urb_dequeue+0xe4/0x17c)
>> [ 1555.769253] [<c07ea1e4>] (musb_urb_dequeue) from [<c07c33f4>]
>> (usb_hcd_flush_endpoint+0x118/0x130)
>> [ 1555.778654] [<c07c33f4>] (usb_hcd_flush_endpoint) from [<c07c66ec>]
>> (usb_disable_endpoint+0x58/0xa4)
>> [ 1555.788232] [<c07c66ec>] (usb_disable_endpoint) from [<c07c6828>]
>> (usb_disable_interface+0x3c/0x54)
>> [ 1555.797716] [<c07c6828>] (usb_disable_interface) from [<c07c8f3c>]
>> (usb_unbind_interface+0x160/0x224)
>> [ 1555.807385] [<c07c8f3c>] (usb_unbind_interface) from [<c06a731c>]
>> (device_release_driver_internal+0x1d0/0x1d8)
>> [ 1555.817882] [<c06a731c>] (device_release_driver_internal) from
>> [<c07b062c>] (usbnet_cdc_unbind+0x70/0x78)
>> [ 1555.827926] [<c07b062c>] (usbnet_cdc_unbind) from [<c07b2098>]
>> (usbnet_disconnect+0x48/0xd8)
>> [ 1555.836780] [<c07b2098>] (usbnet_disconnect) from [<c07c8e40>]
>> (usb_unbind_interface+0x64/0x224)
>> [ 1555.845993] [<c07c8e40>] (usb_unbind_interface) from [<c06a731c>]
>> (device_release_driver_internal+0x1d0/0x1d8)
>> [ 1555.856480] [<c06a731c>] (device_release_driver_internal) from
>> [<c06a5bf4>] (bus_remove_device+0xc8/0xf8)
>> [ 1555.866515] [<c06a5bf4>] (bus_remove_device) from [<c06a0e5c>]
>> (device_del+0x180/0x404)
>> [ 1555.874909] [<c06a0e5c>] (device_del) from [<c07c68c8>]
>> (usb_disable_device+0x88/0x130)
>> [ 1555.883300] [<c07c68c8>] (usb_disable_device) from [<c07bd410>]
>> (usb_disconnect+0xb0/0x234)
>> [ 1555.892057] [<c07bd410>] (usb_disconnect) from [<c07bf968>]
>> (hub_event+0xf3c/0x1288)
>> [ 1555.900179] [<c07bf968>] (hub_event) from [<c015306c>]
>> (process_one_work+0x22c/0x55c)
>> [ 1555.908401] [<c015306c>] (process_one_work) from [<c01533c8>]
>> (worker_thread+0x2c/0x5cc)
>> [ 1555.916889] [<c01533c8>] (worker_thread) from [<c015b028>]
>> (kthread+0x140/0x168)
>> [ 1555.924652] [<c015b028>] (kthread) from [<c0100150>]
>> (ret_from_fork+0x14/0x24)
>> [ 1555.932226] Exception stack(0▒
>> U-Boot SPL 2022.01-rc1-00183-gfa5b4e2d19 (Feb 24 2022 - 15:48:38 +0800)
>> Trying to boot from NAND
>>
>> Could you please give me some advice?
>>
>> Thanks
>>
> Adding a printk message on gpio_wdt_ping and redroduce this question:
>
> diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
> index 4102328a522f..fcfd07e0445a 100644
> --- a/drivers/watchdog/gpio_wdt.c
> +++ b/drivers/watchdog/gpio_wdt.c
> @@ -57,6 +57,7 @@ static int gpio_wdt_ping(struct watchdog_device *wdd)
>           case HW_ALGO_TOGGLE:
>                   /* Toggle output pin */
>                   priv->state = !priv->state;
> +               printk("gwp\n");
>                   gpiod_set_value_cansleep(priv->gpiod, priv->state);
>                   break;
>           case HW_ALGO_LEVEL:
>
> Next is the log:
>
> [   90.222821] gwp
> [   91.024956] gwp
> [   91.826936] gwp
> [   92.628898] gwp
> [   93.430888] gwp
> [   94.232859] gwp
> [   94.264325] musb-hdrc musb-hdrc.0: ep11 RX three-strikes error
> [   95.034845] gwp
> [   95.836791] gwp
> [   96.164582] gwp
> [   96.269984] usb 1-1: USB disconnect, device number 3
> [   96.275556] rndis_host 1-1:1.0 usb0: unregister 'rndis_host'
> usb-musb-hdrc.0-1, RNDIS device
> [   97.279609] ------------[ cut here ]------------
> [   97.284455] WARNING: CPU: 0 PID: 67 at
> drivers/usb/musb/musb_host.c:115 musb_h_tx_flush_fifo+0x11c/0x13c
> [   97.294417] musb-hdrc musb-hdrc.0: Could not flush host TX10 fifo:
> csr: 2403
> [   97.301801] Modules linked in:
> [   97.305012] CPU: 0 PID: 67 Comm: kworker/0:12 Not tainted
> 5.15.0-00013-g0ccd7df8f5ad-dirty #123
> [   97.314130] Hardware name: Generic AM33XX (Flattened Device Tree)
> [   97.320515] Workqueue: usb_hub_wq hub_event
> [   97.324928] [<c0111438>] (unwind_backtrace) from [<c010b9f4>]
> (show_stack+0x10/0x14)
> [   97.333066] [<c010b9f4>] (show_stack) from [<c0adc25c>]
> (dump_stack_lvl+0x40/0x4c)
> [   97.341023] [<c0adc25c>] (dump_stack_lvl) from [<c0136264>]
> (__warn+0xf0/0x104)
> [   97.348697] [<c0136264>] (__warn) from [<c01362ec>]
> (warn_slowpath_fmt+0x74/0xbc)
> [   97.356545] [<c01362ec>] (warn_slowpath_fmt) from [<c07e8b40>]
> (musb_h_tx_flush_fifo+0x11c/0x13c)
> [   97.365854] [<c07e8b40>] (musb_h_tx_flush_fifo) from [<c07ea024>]
> (musb_cleanup_urb+0x128/0x204)
> [   97.375069] [<c07ea024>] (musb_cleanup_urb) from [<c07ea1e4>]
> (musb_urb_dequeue+0xe4/0x17c)
> [   97.383829] [<c07ea1e4>] (musb_urb_dequeue) from [<c07c33f4>]
> (usb_hcd_flush_endpoint+0x118/0x130)
> [   97.393230] [<c07c33f4>] (usb_hcd_flush_endpoint) from [<c07c66ec>]
> (usb_disable_endpoint+0x58/0xa4)
> [   97.402810] [<c07c66ec>] (usb_disable_endpoint) from [<c07c6828>]
> (usb_disable_interface+0x3c/0x54)
> [   97.412294] [<c07c6828>] (usb_disable_interface) from [<c07c8f3c>]
> (usb_unbind_interface+0x160/0x224)
> [   97.421963] [<c07c8f3c>] (usb_unbind_interface) from [<c06a731c>]
> (device_release_driver_internal+0x1d0/0x1d8)
> [   97.432461] [<c06a731c>] (device_release_driver_internal) from
> [<c07b062c>] (usbnet_cdc_unbind+0x70/0x78)
> [   97.442505] [<c07b062c>] (usbnet_cdc_unbind) from [<c07b2098>]
> (usbnet_disconnect+0x48/0xd8)
> [   97.451359] [<c07b2098>] (usbnet_disconnect) from [<c07c8e40>]
> (usb_unbind_interface+0x64/0x224)
> [   97.460573] [<c07c8e40>] (usb_unbind_interface) from [<c06a731c>]
> (device_release_driver_internal+0x1d0/0x1d8)
> [   97.471061] [<c06a731c>] (device_release_driver_internal) from
> [<c06a5bf4>] (bus_remove_device+0xc8/0xf8)
> [   97.481097] [<c06a5bf4>] (bus_remove_device) from [<c06a0e5c>]
> (device_del+0x180/0x404)
> [   97.489491] [<c06a0e5c>] (device_del) from [<c07c68c8>]
> (usb_disable_device+0x88/0x130)
> [   97.497882] [<c07c68c8>] (usb_disable_device) from [<c07bd410>]
> (usb_disconnect+0xb0/0x234)
> [   97.506640] [<c07bd410>] (usb_disconnect) from [<c07bf968>]
> (hub_event+0xf3c/0x1288)
> [   97.514762] [<c07bf968>] (hub_event) from [<c015306c>]
> (process_one_work+0x22c/0x55c)
> [   97.522986] [<c015306c>] (process_one_work) from [<c01533c8>]
> (worker_thread+0x2c/0x5cc)
> [   97.531473] [<c01533c8>] (worker_thread) from [<c015b028>]
> (kthread+0x140/0x168)
> [   97.539237] [<c015b028>] (kthread) from [<c0100150>]
> (ret_from_fork+0x14/0x24)
> [   97.546812] Exception stack(0xc3157fb0 to 0xc3157ff8)
> [   97.552106] 7fa0:                                     00000000
> 00000000 00000000 00000000
> [   97.560674] 7fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [   97.569241] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [   97.576170] ---[ end trace 96798796855f16a3 ]---
> [   97.582427] gwp
> [   98.384391] gwp
> [   99.186369] gwp
> [   99.988316] gwp
>
> The last time before dev_WARN_ONCE is [   96.164582] and the next time
> is [   97.582427]. It took about 1.4 seconds.
>
> But It should be 0.8s. Here is my dts configurations about gpio-watchdog:
>
>       watchdog: watchdog {
>           compatible = "linux,wdt-gpio";
>           pinctrl-names = "default";
>           pinctrl-0 = <&gpiowdt_pins>;
>
>           gpios = <&gpio3 8 GPIO_ACTIVE_HIGH>;
>           enable-gpios = <&gpio3 7 GPIO_ACTIVE_LOW>;
>           always-running;
>           hw_algo = "toggle";
>           hw_margin_ms = <1600>;
>       };
>
> The watchdog ping work is trigger by kthread_queue_work, is it means
> dev_WARN_ONCE delayed kthread_queue_work?
>
>
> -----------------
> Siemens Electronic Design Automation GmbH; Anschrift: Arnulfstraße 201, 80634 München; Gesellschaft mit beschränkter Haftung; Geschäftsführer: Thomas Heurung, Frank Thürauf; Sitz der Gesellschaft: München; Registergericht München, HRB 106955

