Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0194DD229
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Mar 2022 02:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbiCRBBH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Mar 2022 21:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiCRBBE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Mar 2022 21:01:04 -0400
X-Greylist: delayed 912 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Mar 2022 17:59:45 PDT
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 87D0A2571A2;
        Thu, 17 Mar 2022 17:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:From:Subject; bh=OR2qj
        uBQdiWkgI9+K8d0p9HnJUjkc3kdSRx8z/WTN3c=; b=Du6LeQXyxYJdH+Ke1ODng
        wF5L5ZWfEHcQcyIjVOo3x2qd2CvEzV2NUpHiUmpDKx+loxwE0yuwzxAmFXydRc6Y
        tgd5ebBeH4D1F5jicXNUvO4yfTny7xurTiTLaDgTbtLBDYt41j7yM4aowA1ayR2j
        ywjqy4MBVDNXUsrt7OV5Bs=
Received: from [192.168.3.109] (unknown [218.201.129.19])
        by smtp10 (Coremail) with SMTP id DsCowABXhGXX1TNiURuyBg--.37789S2;
        Fri, 18 Mar 2022 08:44:08 +0800 (CST)
Message-ID: <8cea8d54-bd3c-5892-96d3-4d16e07ba457@163.com>
Date:   Fri, 18 Mar 2022 08:44:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
To:     Bin Liu <b-liu@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
From:   qianfan <qianfanguijin@163.com>
Subject: dev_WARN_ONCE cause gpio-watchdog reset
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowABXhGXX1TNiURuyBg--.37789S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur13Cw1DAw47XF1UGrWxZwb_yoW5Kw4Upr
        4xAryDArs5Z34Yvw4Skw1Utryrta10kF1DCryxWrnI93W3u34xXFsrtryFkryj9w18A347
        KF1Dtw42yFWvgw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7SdgUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiQgPG7VaEBJMu+AABs4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi:

I have a custom AM3352 board with linux v5.15 support. I had enabled 
gpio-watchdog driver and the timeout of gpio-watchdog is 1.6s .

The system will reboot when AM3352's MUSB driver print warn message: 
(next is the log)

[ 1555.665496] ------------[ cut here ]------------
[ 1555.670343] WARNING: CPU: 0 PID: 345 at 
drivers/usb/musb/musb_host.c:115 musb_h_tx_flush_fifo+0x11c/0x13c
[ 1555.680395] musb-hdrc musb-hdrc.0: Could not flush host TX10 fifo: 
csr: 2403
[ 1555.687779] Modules linked in:
[ 1555.690989] CPU: 0 PID: 345 Comm: kworker/0:1 Not tainted 
5.15.0-00013-g0ccd7df8f5ad #122
[ 1555.699560] Hardware name: Generic AM33XX (Flattened Device Tree)
[ 1555.705946] Workqueue: usb_hub_wq hub_event
[ 1555.710359] [<c0111438>] (unwind_backtrace) from [<c010b9f4>] 
(show_stack+0x10/0x14)
[ 1555.718497] [<c010b9f4>] (show_stack) from [<c0adc24c>] 
(dump_stack_lvl+0x40/0x4c)
[ 1555.726453] [<c0adc24c>] (dump_stack_lvl) from [<c0136264>] 
(__warn+0xf0/0x104)
[ 1555.734126] [<c0136264>] (__warn) from [<c01362ec>] 
(warn_slowpath_fmt+0x74/0xbc)
[ 1555.741973] [<c01362ec>] (warn_slowpath_fmt) from [<c07e8b40>] 
(musb_h_tx_flush_fifo+0x11c/0x13c)
[ 1555.751280] [<c07e8b40>] (musb_h_tx_flush_fifo) from [<c07ea024>] 
(musb_cleanup_urb+0x128/0x204)
[ 1555.760495] [<c07ea024>] (musb_cleanup_urb) from [<c07ea1e4>] 
(musb_urb_dequeue+0xe4/0x17c)
[ 1555.769253] [<c07ea1e4>] (musb_urb_dequeue) from [<c07c33f4>] 
(usb_hcd_flush_endpoint+0x118/0x130)
[ 1555.778654] [<c07c33f4>] (usb_hcd_flush_endpoint) from [<c07c66ec>] 
(usb_disable_endpoint+0x58/0xa4)
[ 1555.788232] [<c07c66ec>] (usb_disable_endpoint) from [<c07c6828>] 
(usb_disable_interface+0x3c/0x54)
[ 1555.797716] [<c07c6828>] (usb_disable_interface) from [<c07c8f3c>] 
(usb_unbind_interface+0x160/0x224)
[ 1555.807385] [<c07c8f3c>] (usb_unbind_interface) from [<c06a731c>] 
(device_release_driver_internal+0x1d0/0x1d8)
[ 1555.817882] [<c06a731c>] (device_release_driver_internal) from 
[<c07b062c>] (usbnet_cdc_unbind+0x70/0x78)
[ 1555.827926] [<c07b062c>] (usbnet_cdc_unbind) from [<c07b2098>] 
(usbnet_disconnect+0x48/0xd8)
[ 1555.836780] [<c07b2098>] (usbnet_disconnect) from [<c07c8e40>] 
(usb_unbind_interface+0x64/0x224)
[ 1555.845993] [<c07c8e40>] (usb_unbind_interface) from [<c06a731c>] 
(device_release_driver_internal+0x1d0/0x1d8)
[ 1555.856480] [<c06a731c>] (device_release_driver_internal) from 
[<c06a5bf4>] (bus_remove_device+0xc8/0xf8)
[ 1555.866515] [<c06a5bf4>] (bus_remove_device) from [<c06a0e5c>] 
(device_del+0x180/0x404)
[ 1555.874909] [<c06a0e5c>] (device_del) from [<c07c68c8>] 
(usb_disable_device+0x88/0x130)
[ 1555.883300] [<c07c68c8>] (usb_disable_device) from [<c07bd410>] 
(usb_disconnect+0xb0/0x234)
[ 1555.892057] [<c07bd410>] (usb_disconnect) from [<c07bf968>] 
(hub_event+0xf3c/0x1288)
[ 1555.900179] [<c07bf968>] (hub_event) from [<c015306c>] 
(process_one_work+0x22c/0x55c)
[ 1555.908401] [<c015306c>] (process_one_work) from [<c01533c8>] 
(worker_thread+0x2c/0x5cc)
[ 1555.916889] [<c01533c8>] (worker_thread) from [<c015b028>] 
(kthread+0x140/0x168)
[ 1555.924652] [<c015b028>] (kthread) from [<c0100150>] 
(ret_from_fork+0x14/0x24)
[ 1555.932226] Exception stack(0▒
U-Boot SPL 2022.01-rc1-00183-gfa5b4e2d19 (Feb 24 2022 - 15:48:38 +0800)
Trying to boot from NAND

Could you please give me some advice?

Thanks


