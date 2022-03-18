Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 209344DDC37
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Mar 2022 15:53:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237479AbiCROym (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Mar 2022 10:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiCROyl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Mar 2022 10:54:41 -0400
Received: from gateway31.websitewelcome.com (unknown [192.185.144.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49405F1AD4
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Mar 2022 07:53:21 -0700 (PDT)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id B08883E4DD7
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Mar 2022 09:53:05 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id VDyTnbk499AGSVDyTndjei; Fri, 18 Mar 2022 09:53:05 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RWX714/jDCCOsaw7lp0A5+LmDt+hl3N9VB86DpnpeYs=; b=WQ7Fnc39x44QGuivKi5K7oCRae
        2aY4PQj66g3pVUe41yXRgcJES+Duj1AUzbUTV5msWJ/R2HubkBMNKI0CZZtgIqMU4kBmNUT+aLU3L
        yJVSFsxFIsHJSdYIOo5YBURPMIn1qUuVHOnYmoAb1LOPhR7blVugER+rbuL36Ui38cXSCXFUThXXi
        ZccEkcDSMUK/1213b+XhZ/1kuKvorwTyGY/c9uxzui9ryWDn+4mSafEkU6ku4EUOTn8xH+4r5Mm0j
        EDWFQMoq+A56KRkJuFKmr3uaCgbIugLmCazf+7c+nk6tFH2SMdOqHoFIpCFlc6zoQwPV2KMFIJljy
        h1XQQBtw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54326)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nVDyT-003h93-60; Fri, 18 Mar 2022 14:53:05 +0000
Message-ID: <1649b585-3030-a8a2-f4e7-91e0bf0eb1a1@roeck-us.net>
Date:   Fri, 18 Mar 2022 07:53:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     qianfan <qianfanguijin@163.com>, Bin Liu <b-liu@ti.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <8cea8d54-bd3c-5892-96d3-4d16e07ba457@163.com>
 <fabca0f0-c901-9cb0-a8ca-974604491d1b@163.com>
 <309dee6d-8c04-7f4f-c2d5-a7e23445e532@163.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: dev_WARN_ONCE cause gpio-watchdog reset
In-Reply-To: <309dee6d-8c04-7f4f-c2d5-a7e23445e532@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nVDyT-003h93-60
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54326
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 7
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RDNS_NONE,SPF_HELO_PASS,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/17/22 23:05, qianfan wrote:
[ ... ]

> 
> So I think it's a bug of MUSB, not caused by dev_WARN_ONCE. But I can't check which stop hrtimer.
> 

Correct. Look at the code:

static void musb_h_tx_flush_fifo(struct musb_hw_ep *ep)
{
...
	int             retries = 1000;
...
	while (csr & MUSB_TXCSR_FIFONOTEMPTY) {
		...
		if (dev_WARN_ONCE(musb->controller, retries-- < 1,
                                 "Could not flush host TX%d fifo: csr: %04x\n",
                                 ep->epnum, csr))
                         return;
                 mdelay(1);
	}

This is where the one second comes from. The function is called from
musb_urb_dequeue() which disables interrupts. This forces a hard stall
of the kernel for a full second.

There is nothing we can do about that in the watchdog driver.

Guenter
