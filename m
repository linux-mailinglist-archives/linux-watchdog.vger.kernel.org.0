Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 683784E1F74
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Mar 2022 05:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243057AbiCUEQr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Mar 2022 00:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239857AbiCUEQq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Mar 2022 00:16:46 -0400
Received: from mail-m972.mail.163.com (mail-m972.mail.163.com [123.126.97.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9EE00102416;
        Sun, 20 Mar 2022 21:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=r66vK
        MgnGWgxcZ0j7uvp8OxxfxEfdRUlFO0G3u2DyxY=; b=WuH98Y0L7JVO0c/Cow7gk
        FEEWuEyNTSWgvFQ7unVPoCWTvatCGDODM64Wbs+TBVsX1Mk0x6rozyhDoTpPhzq2
        kH9a+BkykFjQmFy/Ycu+T2xBDmlMj1yc5KMR/F2xqoFBXTfQSI6NIsnmdLgT7D/E
        znTABHt8r80TLBCFNua0LM=
Received: from [172.20.10.3] (unknown [112.224.136.231])
        by smtp2 (Coremail) with SMTP id GtxpCgC3xD21+zdiPLMiCw--.687S2;
        Mon, 21 Mar 2022 12:14:47 +0800 (CST)
Message-ID: <752077fe-4622-5de7-760c-29b21051abf9@163.com>
Date:   Mon, 21 Mar 2022 12:14:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: dev_WARN_ONCE cause gpio-watchdog reset
To:     Guenter Roeck <linux@roeck-us.net>, Bin Liu <b-liu@ti.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <8cea8d54-bd3c-5892-96d3-4d16e07ba457@163.com>
 <fabca0f0-c901-9cb0-a8ca-974604491d1b@163.com>
 <309dee6d-8c04-7f4f-c2d5-a7e23445e532@163.com>
 <1649b585-3030-a8a2-f4e7-91e0bf0eb1a1@roeck-us.net>
From:   qianfan <qianfanguijin@163.com>
In-Reply-To: <1649b585-3030-a8a2-f4e7-91e0bf0eb1a1@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GtxpCgC3xD21+zdiPLMiCw--.687S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyrCrykJrWfJw45Ww4xCrg_yoW8ZFy8pF
        WfG3WUCF4DX3yYyrnFva1F9345Cws3Gr13GFyfXFyvvr15uF9IgFWftryF9Fy3Crs8JrW7
        tFW2qaykJ3WkA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U-TmDUUUUU=
X-Originating-IP: [112.224.136.231]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiQhfK7VaEBNSkRQAAsR
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


在 2022/3/18 22:53, Guenter Roeck 写道:
> On 3/17/22 23:05, qianfan wrote:
> [ ... ]
>
>>
>> So I think it's a bug of MUSB, not caused by dev_WARN_ONCE. But I 
>> can't check which stop hrtimer.
>>
>
> Correct. Look at the code:
>
> static void musb_h_tx_flush_fifo(struct musb_hw_ep *ep)
> {
> ...
>     int             retries = 1000;
> ...
>     while (csr & MUSB_TXCSR_FIFONOTEMPTY) {
>         ...
>         if (dev_WARN_ONCE(musb->controller, retries-- < 1,
>                                 "Could not flush host TX%d fifo: csr: 
> %04x\n",
>                                 ep->epnum, csr))
>                         return;
>                 mdelay(1);
>     }
>
> This is where the one second comes from. The function is called from
> musb_urb_dequeue() which disables interrupts. This forces a hard stall
> of the kernel for a full second.

Hi, thanks for your's guide. the one second delay plus the times for 
dev_WARN_ON is about 1.5s, it's not friendly for most of all gpio-watchdog.

@Bin Liu

"mdelay(1)" in musb_h_tx_fifo is removed in commit 
68fe05e2a45181ce02ab2698930b37f20487bd24 and adding back in commit 
45d73860530a14c608f410b91c6c341777bfa85d

could we remove mdelay(1) again and and find another way to resolv the 
problem mention in:

commit 45d73860530a14c608f410b91c6c341777bfa85d
Author: Bin Liu <b-liu@ti.com>
Date:   Tue Jul 25 09:31:34 2017 -0500

     usb: musb: fix tx fifo flush handling again

     commit 68fe05e2a451 ("usb: musb: fix tx fifo flush handling") drops the
     1ms delay trying to solve the long disconnect time issue when
     application queued many tx urbs. However, the 1ms delay is needed for
     some use cases, for example, without the delay, reconnecting AR9271 
WIFI
     dongle no longer works if the connection is dropped from the AP.

     So let's add back the 1ms delay in musb_h_tx_flush_fifo(), and 
solve the
     long disconnect time problem with a separate patch for
     usb_hcd_flush_endpoint().

     Cc: stable@vger.kernel.org # v4.4+
     Signed-off-by: Bin Liu <b-liu@ti.com>
     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

> There is nothing we can do about that in the watchdog driver.
>
> Guenter

