Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B891625728D
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 Aug 2020 05:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgHaD7k (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 Aug 2020 23:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgHaD7j (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 Aug 2020 23:59:39 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50695C061573;
        Sun, 30 Aug 2020 20:59:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q1so2296181pjd.1;
        Sun, 30 Aug 2020 20:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CAK2taVhKaOL1VPAdPF1CAKiLijCzZCiNCOhkBkdyH8=;
        b=FcHToBAC1G99IbYmEIWo5XdC31xWX1mAvUYwRIEeyPf6LAcLV0bBBKOv3knx/NLUBs
         lVSx9HmaCeudrJPN2zSRnI3Go52uZVcxayDN/Uw7NZWqvLCo9BMnb4cq1RDrEMQJ5vq7
         Un5H8lUqMaO2qQ/WW+UWWucylH6r8UNWVCAuZmYPDm6lgcB5GHyET72Z2VKUdPWBKyTl
         QnS5U4OhaDRx8nr0ODgTNELx8uyjwSoU20qCWtMp9Y7v72ypOzY7S18io5+LX+txQBDs
         xWqRFCy2B5nL2jVSKUAtfybALPfGuR/8J0t1ilIpzHmeFI671mJOrv85Ezw+SVqUqTIe
         M4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CAK2taVhKaOL1VPAdPF1CAKiLijCzZCiNCOhkBkdyH8=;
        b=BvdlzhSAci6mwsAS7XongTB3U4xXgBd9cLv6UAryr3SFj5vnY16EoXV14Nj5ssdrMd
         DPueAg3RpshED74b4EwV7Uh72C7QuloxVagthS8paohQIHsUyOeMV9eSWdhZgd55Y8B6
         JLsHkr7Y796pvMOzYO2Tx35Rd+cn4p5p40oh4f1iUqRAhHN6e0DIF8ipW2yyAFZpsrZb
         RymBPQedIQmReFWmYzuLRUNOIvHzYZLBRpM+dHcaPS+Xo0OuYCGBfHyFjLZrAaV/seTp
         u6ICSQJQTLsZeBuuIAJ+T01eglbfGKfX3mbKizqpKnRv9Tkgf8amdRe7xHjSuSEOZ8eV
         XAaQ==
X-Gm-Message-State: AOAM533M4VIZjmVA7+7RijJJIdPKhoosxuHHfhwLAs6zRZsV7WGcNl3l
        THGu7q9vIs5SXW2lzNfcwABszZ6vIDw=
X-Google-Smtp-Source: ABdhPJwdKhsm6eCvXoumm3qIA5WBUjkkxHjtzGkZCwEMFQfwgrNR762FTqfxn8sm57bC0WNKDj6xEA==
X-Received: by 2002:a17:90a:eb15:: with SMTP id j21mr9366185pjz.83.1598846378718;
        Sun, 30 Aug 2020 20:59:38 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m22sm5479595pja.36.2020.08.30.20.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2020 20:59:38 -0700 (PDT)
Subject: Re: [PATCH 08/10] ARM: dts: Cygnus: Fix SP805 clocks
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
References: <20200828130602.42203-1-andre.przywara@arm.com>
 <20200828130602.42203-9-andre.przywara@arm.com>
 <20200831035506.1332109-1-f.fainelli@gmail.com>
Message-ID: <4d9e64dd-c081-f68e-0682-a9e30e8e4793@gmail.com>
Date:   Sun, 30 Aug 2020 20:59:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200831035506.1332109-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 8/30/2020 8:55 PM, Florian Fainelli wrote:
> On Fri, 28 Aug 2020 14:06:00 +0100, Andre Przywara <andre.przywara@arm.com> wrote:
>> The SP805 DT binding requires two clocks to be specified, but the
>> Broadcom Cygnus DT currently only specifies one clock.
>>
>> In practice, Linux would pick a clock named "apb_pclk" for the bus
>> clock, and the Linux and U-Boot SP805 driver would use the first clock
>> to derive the actual watchdog counter frequency.
>>
>> Since currently both are the very same clock, we can just double the
>> clock reference, and add the correct clock-names, to match the binding.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
> 
> Applied to qspi-fixes, thanks!

Applied to devicetree/next actually, likewise for the next patch.
-- 
Florian
