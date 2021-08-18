Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3553F0622
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Aug 2021 16:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240108AbhHROPu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Aug 2021 10:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240078AbhHROPC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Aug 2021 10:15:02 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74D9C0617AF
        for <linux-watchdog@vger.kernel.org>; Wed, 18 Aug 2021 07:13:54 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso3774710ott.13
        for <linux-watchdog@vger.kernel.org>; Wed, 18 Aug 2021 07:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H6ioAUWHN0lVN5psDEEqF1fS41QxUF6FbUYzY+KOJz8=;
        b=a+Fn1vK1PEEdjIUR3JRA1wLADM4rbGw+Ld/qAamKhfXMRZ8oJl7GXOrB9cFrXBPrpt
         dfCkSH1GBz7Jn4XnhZKq9rRvoALBGdttJkrHdG3Iw9NEqInNpM3CXU0umWnMjHP6Wnqk
         YdAOT9grKjQO+9n9I5b7YokVbG2w1gmF9lOzqdqsreAhj8QvdrvQbV1VnNlrM4f9IKDv
         K2Q/TMPG6VUbXHgSMFLochYqc3jXqkstomEvnhbnz3JyjOOJM6vQbHy618zbK4qQtOTE
         5A34XJtWs3w8cXGWiwJb5++sYRSA/8reoMy9mC8Txd/Czl0W6nJjs7AlKMa+6dY6tc3M
         gAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H6ioAUWHN0lVN5psDEEqF1fS41QxUF6FbUYzY+KOJz8=;
        b=D5Xo3TNGatNmy4Us5w6iIcGZe+36CL46JpHKMKuIApRBEkZuFkWOEUIAbs6dY15FeZ
         93q1uCMbymQy0kg/ns460CEN9QFNQZnOOvvSoXmoEDDisMxH3lO+SEc6TNT2ent0C0KZ
         KEhZqPRMTzvdlD2gIfxJnExCj0kpwPVTtcShYU8FWxkECCjjG8hPSD1OQ2TGQAG0IyBg
         vy6LBzpvgIxCXLeISWqycmbUhIgXbrkeQUlkKYFhMZdRUBJyQeeZUuuGayQCwgIQwzpJ
         flLhNo/1ubawbDiren14r1kFHUg0KBhVQPSHSRFxGNJCC6HrHh0nA92dnJvNnBf0vuS1
         8MoA==
X-Gm-Message-State: AOAM533oX8222dGb7vVeSiHPpRviDt6CKqnp60OieRbRk126q04P3HRW
        tlQlOxRmdIRqZt/4Z1IRtL4=
X-Google-Smtp-Source: ABdhPJyVmOwiaV2IdsuJRgY5/5SCLSNeTxq9BoScjvegcOdJongjaIm7IAsF+1kdsXiqaPJ9nbaVjg==
X-Received: by 2002:aca:5c0a:: with SMTP id q10mr7571046oib.11.1629296033010;
        Wed, 18 Aug 2021 07:13:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c16sm23976otp.59.2021.08.18.07.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 07:13:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [Watchdog drivers] - WDIOC_GETSUPPORT clarification
To:     Jose Noguera <jnoguera@redhat.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     Hans De Goede <hdegoede@redhat.com>,
        Peter Robinson <perobins@redhat.com>
References: <CAKu6O181WOq36RCDO0VPcsZZoUFAJ88BMqv0Hqf+qYCeZsMJtQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <9866b7d2-1d43-db77-fa79-0be4bed51f5f@roeck-us.net>
Date:   Wed, 18 Aug 2021 07:13:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKu6O181WOq36RCDO0VPcsZZoUFAJ88BMqv0Hqf+qYCeZsMJtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/18/21 2:57 AM, Jose Noguera wrote:
> Hello all!
> 
> I’m Jose, working in Red Hat on Fedora IoT and RHEL For Edge related projects.
> 
> While trying to add the feature of figuring out whether the current boot was triggered or not by a hardware watchdog using wdctl, we’ve found an odd behaviour in the drivers definition that we would like to check with you.
> 
> Looking specifically for the flag WDIOF_CARDRESET, we can find 40 files that contain it:
> 
> $ grep -rl CARDRESET drivers/watchdog/ | wc -l
> 40
> 
> but only 19 of them have the flag advertised in the options field of the watchdog_info struct returned by the WDIOC_GETSUPPORT ioctl.
> 
> This leads to wdctl not showing WDIOF_CARDRESET for drivers like i6300esb, even when the board had been reset this way:
> 
> $ sudo wdctl
> Device: /dev/watchdog0
> Identity: i6300ESB timer [version 0]
> Timeout: 30 seconds
> Pre-timeout: 0 seconds
> 
> FLAG DESCRIPTION STATUS BOOT-STATUS
> KEEPALIVEPING Keep alive ping reply 1 0
> MAGICCLOSE Supports magic close char 0 0
> SETTIMEOUT Set timeout (in seconds) 0 0
> 
> Working with Hans (in CC), we added a little patch (BugZilla ticket: 1993983) on wdctl and this would be the output of the command when it was a card reset triggered boot:
> 
> $ sudo wdctl
> Device: /dev/watchdog0
> Identity: i6300ESB timer [version 0]
> Thank you all for your time,
> 
> Jose

> Timeout: 30 seconds
> Pre-timeout: 0 seconds
> 
> FLAG DESCRIPTION STATUS BOOT-STATUS
> CARDRESET Card previously reset the CPU 1 1
> KEEPALIVEPING Keep alive ping reply 1 0
> MAGICCLOSE Supports magic close char 0 0
> SETTIMEOUT Set timeout (in seconds) 0 0
> 
> So our question is, may we know what is intended to be present in ident.options? What should the API call WDIOC_GETSUPPORT return in the options field?
> 

Search for WDIOC_GETSUPPORT in Documentation/watchdog/watchdog-api.rst.
I don't see any ambiguity there. Patches welcome.

Guenter
