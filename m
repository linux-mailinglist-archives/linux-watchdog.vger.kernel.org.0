Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C599C50672D
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Apr 2022 10:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236755AbiDSIwX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 19 Apr 2022 04:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234883AbiDSIwX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 19 Apr 2022 04:52:23 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FA422B23
        for <linux-watchdog@vger.kernel.org>; Tue, 19 Apr 2022 01:49:36 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id b7so5201638plh.2
        for <linux-watchdog@vger.kernel.org>; Tue, 19 Apr 2022 01:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=70eSnGuw9o8loBttndD7gTXARu4TSWQMRPzp0nusFp0=;
        b=Vft4Q6QcKEB1GhvQwWAvBCqgdhpT/Yt4S++DVamBTvWu0R+3k5aoI1CPP5q5CzqV6a
         EzdVz0JBQ5nbBL7PUBM1PbRd2zPV4nN5aqwbgcahbXDo3KqzJ9TXtNlpKIqCbdEuhNV+
         YepYEtDmr2EZw9Ask+8YGOdOMhr/3VcuONjbg17x5lOHSk4Ocx7JKutu8bhVn353Mhbp
         SKUo210a4lvIVyLOgIEueFoG7lhd8M6LOL3KClLlUVXPS07gYAmp0ntIZstO43TKsyqp
         NhTD+bfe8xQ0amnpp7y8nNw4actXdi8NV4fK5mN5P/MvQWJZS5YVPB6DDxwbOG7dA2wh
         5EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=70eSnGuw9o8loBttndD7gTXARu4TSWQMRPzp0nusFp0=;
        b=RYjSaf3tB7OvPFrkjLkaZrT5805MQPp1qSH4y6zLY0YhYScGooavgCHOd9vPqvLJ8g
         geD0BpZ57Do5sb0/ZAPMaOneXOIvkoC0RJlP0lX6hWXAYt+b1ZM/DSlH19ZNZGVPSJiW
         zmuDA6XbjAsxQGXSfzwbtsBMfP32VW6+xOjHDhjOsggCd120g320mMsXm71YcQ2nSpEZ
         3NxMofBCAkgzNt3EDYa6QZzca8g8dBarGmI7+QMvO9Sh3m7UYcmLYJ5FWnpB2N8oSO/C
         EWjbBdFVReauS+4xy3uylnQmUH+J0iZrPMXQ8/p9/J2RW/SEXbCpDndVvV3XXrJyYA66
         XGQQ==
X-Gm-Message-State: AOAM532SlFA/zyRzoq6XndAgRk37otKq+v3wyfvxv6bB1MQQqj7U+6g7
        3z24s6AzNb341NQg3PQ4sZoLwg==
X-Google-Smtp-Source: ABdhPJxgUovYJ3ZolZ5GSrsu8VXLiJX6S4pnWBIYrhAw8oyfYcEzVSt6mZbjSOVu4NsIFWlNGJoigA==
X-Received: by 2002:a17:902:9b98:b0:156:52b1:b100 with SMTP id y24-20020a1709029b9800b0015652b1b100mr14515089plp.174.1650358175689;
        Tue, 19 Apr 2022 01:49:35 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id c11-20020a056a000acb00b004f35ee129bbsm16683990pfl.140.2022.04.19.01.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 01:49:35 -0700 (PDT)
Message-ID: <6c685640-ebbe-e227-a096-99d60b9d499b@ozlabs.ru>
Date:   Tue, 19 Apr 2022 18:49:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [RFC v1 0/2] Add driver for PAPR watchdog timers
Content-Language: en-US
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     bjking@linux.ibm.com, nathanl@linux.ibm.com, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com
References: <20220413165104.179144-1-cheloha@linux.ibm.com>
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220413165104.179144-1-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 14/04/2022 02:51, Scott Cheloha wrote:
> This series adds a driver for PAPR hypercall-based watchdog timers,
> tentatively named "pseries-wdt".
> 
> I wanted to get some clarification on a few things before submitting
> the series as a patch, hence the RFC.  The first patch adding the
> hypercall to hvcall.h is straightforward, but I have questions about
> the second patch (the driver).  In particular:
> 
> - In pseries_wdt_probe() we register the watchdog device with
>    devm_watchdog_register_device().  However, in pseries_wdt_remove(),
>    calling watchdog_unregister_devce() causes a kernel panic later,
>    so I assume this is the wrong thing to do.


It should have been devm_watchdog_unregister_device() (no difference 
though) and what was the backtrace? Most watchdog drivers do it this way 
  :-/


>    Do we need to do anything to clean up the watchdog device during
>    pseries_wdt_remove()?  Or does devm_watchdog_register_device()
>    ensure the cleanup is handled transparently?
> 
> - In pseries_wdt_probe(), is it incorrect to devm_kfree() my
>    allocation in the event that devm_watchdog_register_device()
>    fails?

I am pretty sure nothing is going to free the memory you allocated in 
devm_kzalloc() as you do not even pass the allocated pointer to 
devm_watchdog_register_device(), it is an offset. The only reason 
devm_kfree(&pw->wd) won't barf1 is @wd is the first member of the 
pseries_wdt struct.


> - The enormous hypercall input/output comment is mostly for my
>    edification.  It seems like the sort of thing that will rot over time.
>    I intend to remove most of it.  However, as far as I know the PAPR
>    revision containing these details is not published yet.  Should I
>    leave the comment in to ease review for now and remove it later?
>    Or should I omit it from the initial commit entirely?

I'd probably remove some empty lines and add shorter comments inline, like:

+/* Bits 56-63: "timeoutAction" */
+#define PSERIES_WDTF_ACTION(ac)			SETFIELD(ac, 56, 63)
+#define PSERIES_WDTF_ACTION_HARD_POWEROFF	PSERIES_WDTF_ACTION(0x1) // 
"Hard poweroff"
+#define PSERIES_WDTF_ACTION_HARD_RESTART	PSERIES_WDTF_ACTION(0x2) // 
"Hard restart"
+#define PSERIES_WDTF_ACTION_DUMP_RESTART	PSERIES_WDTF_ACTION(0x3) // 
"Dump restart"


The quoted text would tell what to search literally for in the PAPR spec 
when it is updated.


> - Should we print something to the console when probing/removing the
>    watchdog0 device or is that just noise?
> 
>    Most drivers (as distinct from devices) seem to print something
>    during initialization, so that's what I've done in
>    pseries_wdt_module_init() when the capability query succeeds.


I'd say it is noise but since the watchdog is not represented in the 
device tree, there is really no other way of knowing if it is running 
(unless it is a module?).

One line message in pseries_wdt_probe() with 
PSERIES_WDTQ_MAX_NUMBER/PSERIES_WDTQ_MIN_TIMEOUT should do.


> - The timeout action is currently hardcoded to a hard reset.  This
>    could be made configurable through a module parameter.  I intend
>    to do this in a later patch unless someone needs it included
>    in the initial patch.

Make it in the initial patch, it is just a few lines.


> - We set EIO if the hypercall fails in pseries_wdt_start() or
>    pseries_wdt_stop().  There is nothing userspace can do if this
>    happens.  All hypercall failures in these contexts are unexpected.

The userspace can log the event, send an email, "sync && reboot", dunno.

>    Given all of that, is there is a more appropriate errno than EIO?
> 
> - The H_WATCHDOG spec indicates that H_BUSY is possible.  Is it
>    probable, though?  Should we spin and retry the hypercall in
>    the event that we see it?  Or is that pointless?


Looks like the other parts of pseries do retry after calling cond_resched().

> 
> 
