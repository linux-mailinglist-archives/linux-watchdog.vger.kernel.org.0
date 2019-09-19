Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A211B7452
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2019 09:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387729AbfISHks (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 19 Sep 2019 03:40:48 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:35189 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387750AbfISHks (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 19 Sep 2019 03:40:48 -0400
Received: by mail-pf1-f177.google.com with SMTP id 205so1726027pfw.2
        for <linux-watchdog@vger.kernel.org>; Thu, 19 Sep 2019 00:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=techveda-org.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=CMGuIfdJwy5bt4geIdAc0eJZu6Nf33SLJOO5XBhd0p0=;
        b=CZXs087stCim78gFlEL9Z5JULvrxO+0sERTwBfC8Y/zpARYd2F5zNOftaf9+Ghj9hm
         8Up3glPWXVtC/fdwktcmL4cmJy8TWzAkmUYyKKtnelvXWPBsevom2GYkOrDOt9sUJbRZ
         mLXaG+RPhVSD9WXHOZXtS3/DZM6pq8cqqafLFhKLPb9VBoqGR6laLEUteNSq+QK2dMPS
         Q+LH7NXEnLSvny5+xuaB3McoUP87xVxiXS3m0SFL3BUvDrbnAMlGiQ2hYd2Obqc8sgRB
         ByZTdzljtcWUxyzQC93/Pgw7FJp12R0VXmmdar2v8C/03uoW/eW4avp8yDp72c0RRehn
         LLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=CMGuIfdJwy5bt4geIdAc0eJZu6Nf33SLJOO5XBhd0p0=;
        b=QdHopchbELyLhtpMGZ5E4RpqdEWk0ckQPj52jT/UoTHSLnIezuugTsKRKuMm57UmjP
         sMRy4YdAUW4ZgqRei1FWjXWI/6wrHL2Rb9Zus0F4AgNfOLVRLUeHvE6nSal1qsuuFT2D
         usz4Hl2Bc/AeVImRdy+B+25qGhWlm6jehXAERJ/igq4gAwyNngoh8/gGuRj1odwqYoqp
         zipTupBuHA7W+tWOHnSdNSDuYEKHsS0aWz4wovmhK+3Y4jjh7pJKOkVMaDNAcaX9H3D9
         jmqrFiH9uC0GJdgBHmPTGN6SOXl8qqPpzYnKFliliFrfydxSMXaOrOfma1WzuTZI30w7
         RcLQ==
X-Gm-Message-State: APjAAAV8w4227lMU6Bn3eI+K0SwC88DKaYM+vJPloTZ8JlcuqJn26Q4F
        U/0/7CRyob+JpNK4FjV8TWS7124rodY=
X-Google-Smtp-Source: APXvYqyPI7D3LtW3PYG+4t4qs0hFFNw1766ML/70CE4KjxoGLftVJj3lzgTj+anyGqIi79UbS3J3Cg==
X-Received: by 2002:aa7:86c1:: with SMTP id h1mr8890668pfo.128.1568878847311;
        Thu, 19 Sep 2019 00:40:47 -0700 (PDT)
Received: from [192.168.1.100] ([123.201.163.9])
        by smtp.gmail.com with ESMTPSA id y138sm12343001pfb.174.2019.09.19.00.40.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 00:40:46 -0700 (PDT)
To:     kgene@kernel.org, krzk@kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, heiko@sntech.de
Cc:     linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org
From:   Suniel Mahesh <sunil.m@techveda.org>
Subject: Samsung based S3C2440A chipset - watchdog timer issue
Message-ID: <652bf0b2-3681-47f2-3b50-40edff52a7b5@techveda.org>
Date:   Thu, 19 Sep 2019 13:10:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

I am working on one of the Samsung based S3C2440A chipset based target .

I have couple of questions and I request someone to shed some light on these: (Thank you)

The watchdog driver in linux, looks like, it just configured WDT but didn't start it (code snippet included below).

May i know the reasson why WDT is not started ? Is it because u-boot already started WDT, implies it is not required to do the
same once we jump into linux ? or is there any specific reason ?

drivers/watchdog/s3c2410_wdt.c (line 53 and lines 616 - 625)

#define S3C2410_WATCHDOG_ATBOOT         (0)
....
static int tmr_atboot   = S3C2410_WATCHDOG_ATBOOT;
...
...
if (tmr_atboot && started == 0) {
                dev_info(dev, "starting watchdog timer\n");
                s3c2410wdt_start(&wdt->wdt_device);
        } else if (!tmr_atboot) {
                /* if we're not enabling the watchdog, then ensure it is
                 * disabled if it has been left running from the bootloader
                 * or other source */

                s3c2410wdt_stop(&wdt->wdt_device);
        }
...
...

Tried to start WDT in linux by assigning value 1 to S3C2410_WATCHDOG_ATBOOT. The target resets.

please comment.

Thanks-- 
Suniel Mahesh
