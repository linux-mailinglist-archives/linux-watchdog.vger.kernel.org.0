Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8040174E3A
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Mar 2020 17:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgCAQKt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 1 Mar 2020 11:10:49 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43630 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgCAQKs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 1 Mar 2020 11:10:48 -0500
Received: by mail-pl1-f194.google.com with SMTP id p11so3181416plq.10;
        Sun, 01 Mar 2020 08:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bMLGGlLxbtGLfHweAPeUm/il22po9rJeFTwsg4VAzRg=;
        b=s/LjHIapw57aPnFnAe+O8GoGOw3PvJqyTnCUAWDr6n4eiB8u5/tO1zMOHiGVyXjRZi
         SpKaftcG8IjIFLs7Q3wOuQhPWHKsfbZRkmBkGhcd/U9C/QLABXJrUpUMstctOwqUqdvH
         DB4UN1FLU2iTpKnKlqDvaHZ48r1Kyo/P3jvHz/gPkCaK/a1U288h6X0qdKw/XrBgDOk4
         KUDtuBdpSr24ZuDdSWcN3ur1OxCs7PD6X2MLcpe21MCLCNv606osi6O698uqOmTX8p2b
         ZG18TypSvljNczSofsmyDaVy1EYI4Lv7HetoUvzVEwzb9K6vK5CNZBUf+g0SiXgWsqBx
         Y+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bMLGGlLxbtGLfHweAPeUm/il22po9rJeFTwsg4VAzRg=;
        b=Wj8TQTV6kLmzzf4i+BzWZPha4WMYSuVOdZr2jA70cHLoigffrPnhMJWTinXc10fDNL
         0XRzIV1C20M3stld4cR7TmZtF2WF5LBL+8Tx7QKgO7eJzfTsd8uCOAvroMkqb3PvgIJM
         Qvl7RHacXyA7ElIn0k4KKjqfE5q/XvClBC0NyABEdbbKaYelb7+ueik9BRerQR38Eepk
         5IwjDWuuAKldZsnS/uLzlzuSttXvE1j98UtHNbn4xIlThIXKKkMRM/HD3RpRLnaFsWBt
         2zuxMyM9GkwBiwxp9gDEKzCcinWjUS0LbTGn/xlv7/P+mHiG85lyIpFb2CaJpM++FYkF
         kCdg==
X-Gm-Message-State: APjAAAWd8wBB2Dv0qq9XNBdFNa1UMVfaDbigL9k3/aa9adC3r/RykUug
        q8kuxMHJDkqzZUVs9Q7F2gxyExft
X-Google-Smtp-Source: APXvYqwAxMFAZB8IXTlP8S5DN+I7djzpBt11DytFo2LxcqFCce6k2vQrPeE8OJ3zN8RsB0osoeqmIQ==
X-Received: by 2002:a17:90a:cb11:: with SMTP id z17mr16234153pjt.122.1583079047338;
        Sun, 01 Mar 2020 08:10:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h132sm13752512pfe.118.2020.03.01.08.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2020 08:10:46 -0800 (PST)
Subject: Re: [PATCH v1 4/4] watchdog: npcm: sets card ext1 and ext2 bootstatus
 during probe
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20200301094040.123189-1-tmaimon77@gmail.com>
 <20200301094040.123189-5-tmaimon77@gmail.com>
 <026fa94c-8fde-acda-e218-ffff9b5891c9@roeck-us.net>
 <CAP6Zq1hPsnJ1UxAQ-wK_pkaJqzWRQ-_g5-k0Kag2YoP+c2fPjQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <998cedf4-82cb-be1b-699f-608ea7a21064@roeck-us.net>
Date:   Sun, 1 Mar 2020 08:10:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAP6Zq1hPsnJ1UxAQ-wK_pkaJqzWRQ-_g5-k0Kag2YoP+c2fPjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/1/20 8:08 AM, Tomer Maimon wrote:
> Sorry Guenter probebly I didnt explain it well.
> 
> 
> On Sun, 1 Mar 2020 at 12:48, Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
> 
>     On 3/1/20 1:40 AM, Tomer Maimon wrote:
>     > During probe NPCM watchdog sets the following bootstatus flags:
>     >       - WDIOF_CARDRESET represent power and core reset.
>     >       - WDIOF_EXTERN1 represent watchdog 0-2 reset.
>     >       - WDIOF_EXTERN2 represent software 1-4 reset.
>     >
>     > Each flag is representing a group of bootstatus.
>     > The user can configure through the device treethe exact reset
>     > to each flag group.
>     >
> 
>     Sorry, this doesn't make sense to me. I could understand reporting
>     the above, but it looks to me like devicetree is used to associate
>     a reset bit from the controller with one of the above.
>     Devicetree only seems to be used to associate reset status bits
>     from the controller with WDIOF_CARDRESET, WDIOF_EXTERN1, or
>     WDIOF_EXTERN2. That adds a lot of complexity for little if any
>     gain. 
> 
>      
> 
>     It would make sense to set the bootstatus bits as suggested above,
>     but that doesn't require devicetree properties.
> 
>     More comments inline.
> 
>     Guenter 
> 
>  
> 
> In the NPCM750 we have the following reset types:
> 
>  1. board reset (Power on reset, Core reset)
>  2. WD reset (0-2 WD reset).
>  3. SW reset (1-4 SW reset).
> 
> 
> Each board can use different reset types, because in the WD status bit there is not enough bits to represent the entire NPCM750 resets.
> 
> The NPCM750 reset groups are represent as follow:
> 
>  - WDIOF_CARDRESET represent power and core reset.
>  - WDIOF_EXTERN1 represent watchdog 0-2 reset.
>  - WDIOF_EXTERN2 represent software 1-4 reset.
> 
Exactly, and I don't see a need to be more specific than that.
This can be implemented without all the DT complexity.

Guenter
