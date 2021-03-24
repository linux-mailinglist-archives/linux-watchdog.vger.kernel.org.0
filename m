Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246F2347A22
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Mar 2021 15:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhCXOCn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Mar 2021 10:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235553AbhCXOCK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Mar 2021 10:02:10 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CA8C061763;
        Wed, 24 Mar 2021 07:02:09 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so23107653otn.1;
        Wed, 24 Mar 2021 07:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MVxQXDLo+TFM9ep9KeYmseAjJy7lefxBvzfXNcFgDeA=;
        b=OOZ/wVDUD8gGxmywi34+GHR2KKFw0ucqb+uRDFPBkl+7FcpTi6mpvn1nT7Gs17Ve6T
         DKJVU56HfvToMLGzxNOj3dKZrzOLi90Sc0CJI+cE/0i3520d8C1KHFjFqe/plrKulJso
         5SZhGwknD5Hl7mDRPWq5tUpydPxgAuNXEadk8AhKgIFiiT4Wksvwzl02d8HZ1hDx+qM6
         VTMJQrJzwY1R3G0gQQCvRteTDCsNvwZ2SB/6Gh1CaTbpn/JFtI0IwsMYsYVdXAwEIOyL
         F+kI5vATvow0StTTUYrXvCQe1QyG3fX++az0NSeBZc8yK6qeXeIpGqoaB3MEzK123kqr
         2Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MVxQXDLo+TFM9ep9KeYmseAjJy7lefxBvzfXNcFgDeA=;
        b=KCUjAxK1+wO74lZDto7HogEfstRx0ygs1MKgUb2YbhUGvPVDdQ+3FBHYCgd0YM4j4o
         aeD1jfYmryk2fMdkFJER50iXMRJ2P0OivVn1gi3pt1SvDce2Y7lqv86AP8v9o9N/l4gb
         vAHjrviX5LM+JMsvZx4pso14Bz13n7Pr8SzC/bHWF6AbF+fwZRy5ItHXXAb08tt9mKTE
         zc79Fe5Hei8HMy1dJPtp6S9OFx8Fg/l1wKF3A3ZKv2ii7gIX1F3YfM534u4Y/fn4WhAS
         OFAp6wyHttfrfE9mkJyuwRyRZvFGVXGNNIlBJEB2wZKmR1Pg01zE7F1lTNCEQ3GdkQ3g
         2aPA==
X-Gm-Message-State: AOAM530C2LrrLvbtqLg7vzrtY3+k3KaVLXpNB+okQ6dhLHuw+Xz++U/2
        araYuYyZcu1Vm7HTO4/mU0NGXVpaNKE=
X-Google-Smtp-Source: ABdhPJzhjvB/2bAjZzu3cmXUOzwLcaosQF2Kc4NfZ6PUoDgkT4OKrKeqsH5+KloXa4KJljlTbSmRXg==
X-Received: by 2002:a05:6830:1546:: with SMTP id l6mr3470335otp.139.1616594529139;
        Wed, 24 Mar 2021 07:02:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r20sm562387otd.26.2021.03.24.07.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 07:01:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 7/9] watchdog: of_xilinx_wdt: Add Versal Window watchdog
 support
To:     Srinivas Neeli <sneeli@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
 <1615805214-24857-8-git-send-email-srinivas.neeli@xilinx.com>
 <ad8435c4-d344-fd0b-2c98-3bdd974f5175@roeck-us.net>
 <DM6PR02MB53866BB023B6B525D48B76F9AF639@DM6PR02MB5386.namprd02.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <2241024e-3791-4733-4d4a-a4ea12582e92@roeck-us.net>
Date:   Wed, 24 Mar 2021 07:01:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR02MB53866BB023B6B525D48B76F9AF639@DM6PR02MB5386.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/23/21 11:04 PM, Srinivas Neeli wrote:
> Hi Guenter,
> 
> Thanks for review
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Tuesday, March 16, 2021 8:01 AM
>> To: Srinivas Neeli <sneeli@xilinx.com>; Michal Simek <michals@xilinx.com>;
>> Shubhrajyoti Datta <shubhraj@xilinx.com>; Srinivas Goud
>> <sgoud@xilinx.com>
>> Cc: wim@linux-watchdog.org; linux-watchdog@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; git
>> <git@xilinx.com>
>> Subject: Re: [PATCH 7/9] watchdog: of_xilinx_wdt: Add Versal Window
>> watchdog support
>>
>> On 3/15/21 3:46 AM, Srinivas Neeli wrote:
>>> Versal watchdog driver uses Window watchdog mode. Window watchdog
>>> timer(WWDT) contains closed(first) and open(second) window with
>>> 32 bit width. WWDT will generate an interrupt after the first window
>>> timeout and reset signal after the second window timeout. Timeout and
>>> Pre-timeout configuration, Stop and Refresh trigger only in open
>>> window.
>>>
>>> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
>>
>> I think this should be a separate watchdog driver. There is pretty much no
>> overlap with the existing driver.
> 
> Xilinx AXI Timebase Watchdog Timer supports two independent modes
> 1)Timebase Watchdog Mode
> 2)Window Watchdog Timer Mode.
> Current of_xilinx_wdt.c driver already have support for Timebase Watchdog Mode, but Window watchdog timer Mode feature is missing.
> Versal platform contains customized AXI Timebase Watchdog Timer, which supports Window Watchdog Timer Mode.
> For that reason we are creating common driver for both the modes.
> 

That is not an argument. The two watchdogs are still completely different,
and there is no value having a single driver.

Guenter
