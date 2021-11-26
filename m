Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37CE45F15B
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 17:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378324AbhKZQPn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 11:15:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378343AbhKZQNm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 11:13:42 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA353C061396;
        Fri, 26 Nov 2021 08:02:15 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id h16-20020a9d7990000000b0055c7ae44dd2so14521079otm.10;
        Fri, 26 Nov 2021 08:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PbeEnRWON9pb9nGRnrDkYtKRKVz+bBqeqfOhcC0/LMY=;
        b=QlJ9BT79vV+UgbBLPVB9SHqwpuKF958qe/4Mo/aARVO9cwjFiv/Uw2PK81fwi8831u
         Kip3tKmilWiTExI1OXx7XUqnowj7MjbDU8c22FkUt5c4bOr2jJtcjkKaYB3w7oBuwHPP
         G7tS/FN5o7g8VZ4NO4BPxVFPv5Yv8SYiAX4yDHAdYoZgaG1h6KsW8PC+ritaYArqGSzm
         hXjEbnx2+wi117uh94SJkoqMIZOFZ3UaHFzldYRjpbkAm4bg4cY5HTDh5zEs2pOjLzkG
         uGTntQHgts3Y2ky15w5GgWss37Lqggj8cl8c5y60WWmXoI4upgPFMjHam7LRlTgKoNje
         cF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PbeEnRWON9pb9nGRnrDkYtKRKVz+bBqeqfOhcC0/LMY=;
        b=s0+eRKuz3H2AtRX5dGGrCJq8JeiAhS0Nysm+6NSwx8IGqVwW9mcarcQpMB0MPn/9ew
         IV73+M1PHH+VEGlLEWCWV+PL9YJmuzqqyEbFW8fDFP60hzhpA6sWeLAqpzd4rvKVNd7K
         bTvf8GUwFdZyuBu/9OVowFUv91o433yNHA06FGatxsFT/3EKlyjvFpDHcbR8rM2Z4BOX
         EJq+cM+zjr6NefMbzVJAtxk/5OXawZMTu/CSuR/PixphG/xvhXwQLDV40Ly2K7dqumnd
         cDnknCZmVbUuNv2Ue6+ZyDDQ749WAY0wj7Eh3xKovFd25yoUH2ZSUV0IClbl/hTcquOV
         O6Cg==
X-Gm-Message-State: AOAM531dn5RrnmFCA+SjHjQ66flrOes92adY1oCUcaiemsWL2DsfZZC9
        6Oh8unatM5CRmoHc/4fN660=
X-Google-Smtp-Source: ABdhPJwV1CDUTlflKha7g6Adxid3NIOO8qLf9lChHNmx1HWiM56hDEuK98fgA+qincEt48HzMVN2XQ==
X-Received: by 2002:a05:6830:169a:: with SMTP id k26mr29165571otr.64.1637942535128;
        Fri, 26 Nov 2021 08:02:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r11sm1132492oth.48.2021.11.26.08.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 08:02:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4 0/4] add device drivers for Siemens Industrial PCs
To:     Henning Schild <henning.schild@siemens.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Weigelt <lkml@metux.net>
References: <20211126141027.16161-1-henning.schild@siemens.com>
 <20211126163410.2806de5f@md1za8fc.ad001.siemens.net>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a1a6c43d-401c-19f1-9773-696402974f6b@roeck-us.net>
Date:   Fri, 26 Nov 2021 08:02:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211126163410.2806de5f@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/26/21 7:34 AM, Henning Schild wrote:
> Hi all,
> 
> in p3 not too much was left open so i hope this might be the last and
> might be quick.
> 
> The two points that have been open where:
>   1 wish to split wdt driver into two
>   2 wish to use pinctrl for LEDs/WDT
> 
> 1 was ignored for now. We can split later when we add more devices. It
> remains unclear if splitting is the way to go when more devices come.

The code is already quite messy, in part because memory regions are
declared locally and not passed through the parent device as they should.
I don't see how splitting the driver into multiple drivers would improve
the situation. The platform code claims to be inspired by the lpc_ich
driver. Maybe it should take a real example from that and pass version
or variant specific details through platform data instead of maintaining
it in the watchdog driver.

Guenter
