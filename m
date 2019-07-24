Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B33A772BA7
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jul 2019 11:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbfGXJoB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Jul 2019 05:44:01 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44492 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfGXJoB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Jul 2019 05:44:01 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so20948041pgl.11
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Jul 2019 02:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hqJTdtcLT5WgCPQqu+WH2AVJUiqXI2/zFsBg3smcUp4=;
        b=H/mPGVfkFRhqVKE7o+Id+EO3OHAjRmk3LVfr+qgSlJwD3sR/raxci8vPS9qtkdj2JH
         vSgVhxqd/jdXfz2Rle8BFgYM9oDe9nl+ghgjAl4U+PLKsAAvGLt8gM9DjNRyJ8hnsJ4g
         wNN8/tmJqwZfS4VsLZPNn2o1PgcYGgPM2xJ5Af5iQAJ986sVD84gbkO01yb3kOfV8ESG
         FN3AuDxvoIXbWl+/KD87Z2XswqLiuw7XRpOU3zQLvhvYPt5Uq2r17+8gs9lHEOIxPFSz
         /Qxi/zLedQSkAdiIIZ4YTQwri1Pa4O5SDeEhAKQDVBiq6wdFSWpniCbu6bOoSyFBlvvx
         1HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hqJTdtcLT5WgCPQqu+WH2AVJUiqXI2/zFsBg3smcUp4=;
        b=VT1Nhmu7Be1poBkDyi5B/j1KoyCglyhVoSBJProbFb/LL74qfz1kwBGL8agqb9WYk5
         Rcuk069DYmYFj/PCkNZ18ixyR78e5Oui0moY/GeEXimGCEZyqZej+4TpO3u+v3+FnWf0
         gkT4k1uTCeMd5wL+WiC1m3ztg0J6T+5PnNZ8meXY2oRqisEuY1y/2ywWqQgxKlrfT7X6
         LY5KdODwkFnZroHR75iwUqXWZYHDkMu6owriDFAU0WCUaiAfZkk3B0o820PErQdzm7IB
         WrpbBWr83lI56wI7NsZTlXBTTJBa9+1TIWpHX3dk6PDq+4o+BgElOFhidN0BX0WW1+cx
         H5jg==
X-Gm-Message-State: APjAAAUIxaCLr3pSMvNcLYr+lh2JJ7hZmnwP1BALae4VSLC/PXmtakrX
        XN1riPCYOrDBlTyfcaxXr+z/0zPP
X-Google-Smtp-Source: APXvYqze2rdraMHZhq+UxzekKUq+TbUlxnVB+sJKEs6xJUawDR72G5dnG5FGuOZ4avlX/jbySnRyBw==
X-Received: by 2002:a17:90a:ba93:: with SMTP id t19mr85557574pjr.139.1563961440471;
        Wed, 24 Jul 2019 02:44:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t9sm17240327pgj.89.2019.07.24.02.43.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 02:43:59 -0700 (PDT)
Subject: Re: iTCO_wdt on Intel NUC
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?UTF-8?Q?Valentin_Vidi=c4=87?= <vvidic@valentin-vidic.from.hr>,
        linux-watchdog@vger.kernel.org
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
 <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
Message-ID: <2a14874f-1e28-6e42-ab87-b2c1e1ca5ac4@roeck-us.net>
Date:   Wed, 24 Jul 2019 02:43:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/21/19 5:05 PM, Guenter Roeck wrote:
> On 7/21/19 1:30 PM, Valentin Vidić wrote:
>> Hello,
>>
>> I'm having trouble getting iTCO_wdt to work on NUC8i5BEH with kernel 4.19.37-5+deb10u1:
>>
>> [    9.346099] iTCO_vendor_support: vendor-support=0
>> [    9.377211] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
>> [    9.377397] iTCO_wdt iTCO_wdt: can't request region for resource [mem 0x00c5fffc-0x00c5ffff]
>> [    9.377407] iTCO_wdt: probe of iTCO_wdt failed with error -16
>>
>> Is there a way to check if the TCO hardware is missing in this machine
>> or something else needs to be updated to get it working?
>>
> 
> Most likely the memory region is reserved/used by something else. /proc/iomem
> might show you.
> 

Here is a possible explanation for your problem.

https://lore.kernel.org/patchwork/patch/770990/

It seems like the memory resource is indeed reserved by the intel_pmc_ipc driver.

Guenter
