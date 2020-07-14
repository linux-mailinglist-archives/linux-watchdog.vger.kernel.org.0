Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F290921F4D6
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jul 2020 16:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbgGNOmd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jul 2020 10:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728594AbgGNOma (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jul 2020 10:42:30 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC38C061755;
        Tue, 14 Jul 2020 07:42:30 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id md7so1627111pjb.1;
        Tue, 14 Jul 2020 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SP0Naqe+XyrnxJdPH8f9ichHee+APezC6SuY9ngtXIk=;
        b=GV4k29JuC5mkobx0g3nRtMcPBcK9WLwmE/uhek51rHSWApaFN1yLu2Zb0nnq73fUE+
         NOHGuWA9x81GtzwesIZf08C4cpi7nwl9pF1Lxgva49TRvhA4Sz8rKyyQCDH+kgLg5BAt
         GR6Jzp66fdFLtGZmj+ym2g9TW6xOR9FKSOMgdm3CmIH0zjeqRixHoq/bH029UrlKgWrg
         6H3od+zUs5sI4ZqIScykWY06FxP8z3yXA1HPRjg5JaMRE+B77eByQPkQ4BT40DXNwN8L
         D72ErKnc+Be611GdoBTrxC6bM4kR7TW0pwX0ypn7Q+1DzGOOWr5YHpVmD2+q8+oUZGdY
         iPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SP0Naqe+XyrnxJdPH8f9ichHee+APezC6SuY9ngtXIk=;
        b=LY0zv4IU4DLdLutZgwkm8x7PWHKs6ahG2StScsmByYvrQv+5mpEyKJlIXBvpDtSlNo
         Rn31sH2CKDZ32iY0u4f0OGtewMTvLZGJXf5fUOVdIOLvj1aPn2p9oFk4P6JCGXzq3oZJ
         RWgfQelOc7oZelHvUYehOpkkgqZQV7SdkefG6MFE88Kj6o9CL4K9A/98ZZ9Q/r2Ww3ss
         zkjzAQdaY5+E5Ve9QwU/QIsRlIBiKEtz0PESgw9WBRNxo3/GeCHHmsE5vw5D+Bz8/ezl
         5k43OVbxd3x2ZI7Qq4giffDLMMXLkfrfIpgebgDesKHNhHGGTh9lLP87cHjhGifdauCC
         IIqg==
X-Gm-Message-State: AOAM53079bRWEDz07Ja+mI5HCCumGN4E1sip152lgLzKWF54X+ldofy4
        ft9hYyCxrHzTOaXjqAvKIK0=
X-Google-Smtp-Source: ABdhPJyXLpAXYb4IkQRZC+hSMIGJW6iNB3EXKAM3DlPY/X13BbrGTTZ2JMycam+qLSaTRPE+QGLpxQ==
X-Received: by 2002:a17:902:54c:: with SMTP id 70mr4383816plf.0.1594737750382;
        Tue, 14 Jul 2020 07:42:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b14sm17390441pfo.28.2020.07.14.07.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 07:42:29 -0700 (PDT)
Subject: Re: [PATCHv3 3/4] watchdog: rti-wdt: attach to running watchdog
 during probe
To:     Tero Kristo <t-kristo@ti.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jan.kiszka@siemens.com
References: <20200713131818.825-1-t-kristo@ti.com>
 <20200713131818.825-4-t-kristo@ti.com>
 <0c69734d-b301-7762-7614-0644e2a719ba@roeck-us.net>
 <2a92083c-f8bd-7a42-25e2-ee6ae354a4de@ti.com>
 <19373936-7566-3936-428a-2f2f7f3392d4@roeck-us.net>
 <350ea70f-9647-863c-a4f7-6ba7c402ccff@ti.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <ad4bd82f-3f6f-0a32-3d9f-32e66817e61a@roeck-us.net>
Date:   Tue, 14 Jul 2020 07:42:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <350ea70f-9647-863c-a4f7-6ba7c402ccff@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/14/20 12:13 AM, Tero Kristo wrote:
[ ... ]

>>> Well, you can re-program it but... It does not take effect until next window starts, so basically we need to take care of the currently running window anyways after which re-programming it doesn't make much sense anymore. And handling the switch from one setup to next would add extra complexity.
>>>
>>
>> Seems to me that hardware team really made an effort to make the
>> watchdog as difficult to program as possible :-(.
> 
> Yea, it is surprisingly difficult to program... when watchdogs in principle are extremely simple pieces of HW. This claims to be some automotive grade watchdog, which means it has the window in place.
> 

We are getting a bit off topic, but that almost sounds like
"automotive" translates to "it must be hard to program".
I can not think of a valid reason for such a window, no matter
the circumstances. Either case, dealing with the window in the
kernel in that situation (ie if some specification states that
the window must exist) would be the wrong solution and circumvent
the reason for having it in the first place.

Not that this matters here, of course. I am just wondering what the impact
would be if the driver is indeed used in such an application. For example,
some compliance test code might try to ping the watchdog outside the window
to test its reaction. Such test code would fail if the ping is delayed
by the kernel.

Guenter
