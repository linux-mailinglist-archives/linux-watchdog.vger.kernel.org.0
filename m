Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9D6E169751
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Feb 2020 12:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgBWLWB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 23 Feb 2020 06:22:01 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34153 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgBWLWB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 23 Feb 2020 06:22:01 -0500
Received: by mail-ed1-f65.google.com with SMTP id r18so8365121edl.1
        for <linux-watchdog@vger.kernel.org>; Sun, 23 Feb 2020 03:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I7rQJgBtj2WD56CuhDDY5luHd0dpn2aSY0uftQht5ZY=;
        b=L4zCbEHEPzVE43pBLR7WjtzcS3JDvt5WjCIe2+iDIf92RrrcWY75h+Vn/ZR+naVONz
         Fcm5D3OfF3aM7CMksqiP2I+71HuT6iHUs3nsiFj6opaJgJ1vDw9YR0pYZJU8PedHfQA6
         wBD7ISEfBuhjerMlqm11ycAWFmES2smKg9wM+jqewCAztKimeFXNmkXa4IZstD4c/A1T
         6NC8zAAtl71g1htXbl8fxs2pznxDL4EXhIPCwUx62wyZamIJr99eT5Xwxg1Z4U/NQPx3
         Tjx1COuUUmV7AhWJcwyA4atKE/yYfeMIyE2vQWSzM2E6hmRq6ZxfZarJbGXmTwU4qgUB
         vHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I7rQJgBtj2WD56CuhDDY5luHd0dpn2aSY0uftQht5ZY=;
        b=MgIZU7HcCvtavChQaP0RobLPv2xEseBrAGwpu0SHnzxRtvJVEW6X3XRotcwyjs5CH+
         3mAOx3StSR53vDkWlmYxH2ugyf7FTGM1Do93W67IMGU3VFMW/sxyA2LUJNlV6cLir+AP
         Gu20sQabF0eOMnmxhFtBJ4bzz8lAB+GWev3pwrB4weV5BHwqpP/SSruNvFikAk3gH6BT
         gEmHwrF03VzwCI3zBWJvKbIfl7uzCAiB9dOoeBh3EEMvUHi5+TgO4Bs3BWPrgqrw0y/k
         ocK8y4WDkQnpu41shS0xF5ahE3iJ12gHl2mEmmdAA2jwXkJeMG6abMseKLV+huDrvkkT
         uAnA==
X-Gm-Message-State: APjAAAWXdQbzuGIf9YUV5VwP4/zJmYA+yBBgjDHPJL8kEPtRa2HE/K3m
        qX/en0XkQKXraLaGevqn91wMjw==
X-Google-Smtp-Source: APXvYqyD2OOCxUukSbGgSCpuRxlrUzuSY/iqLh1Bk/5C1CX3LGqG3cxQPjzRF8TdhBraa6MyX457BQ==
X-Received: by 2002:aa7:df09:: with SMTP id c9mr41891593edy.133.1582456919461;
        Sun, 23 Feb 2020 03:21:59 -0800 (PST)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8? ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id b9sm762595edm.60.2020.02.23.03.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2020 03:21:58 -0800 (PST)
Subject: Re: [PATCHv2] watchdog: Add stop_on_reboot parameter to control
 reboot policy
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
References: <20200214162209.129107-1-dima@arista.com>
 <20200222160639.GA12925@roeck-us.net>
From:   Dmitry Safonov <dima@arista.com>
Message-ID: <d45c945a-043d-8e18-1f8b-a1e7c7f4d2bb@arista.com>
Date:   Sun, 23 Feb 2020 11:21:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200222160639.GA12925@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On 2/22/20 4:06 PM, Guenter Roeck wrote:
> On Fri, Feb 14, 2020 at 04:22:09PM +0000, Dmitry Safonov wrote:
[..]
>> +static int stop_on_reboot = -1;
>> +module_param(stop_on_reboot, int, 0644);
>> +MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
>> +
> 
> My major concern is that this is writeable at runtime.
> Changing the value won't change the behavior of already loaded
> drivers. Unloading and reloading the driver will change its behavior
> after the value was changed. This would be confusing, and it is hard
> to imagine for anyone to expect such a behavior. Does this have to be
> writeable ?

No, it wasn't. I've messed it up by thinking about fours in 0644, but
for some reason failed to recognize that it allows root writes.

I'll follow up with v3, sorry for simple-minded typo.

Thanks,
          Dmitry
