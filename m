Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9ED73F0406
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Aug 2021 14:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235793AbhHRMxt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Aug 2021 08:53:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48590 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234801AbhHRMxs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Aug 2021 08:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629291193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SLP3QDMix2Fy2z/XbxkaOOGCVei38kfmJ4Q+cqGq+BM=;
        b=A+7QiVZ9xuufGX9r6oVbTo8b8JHo5Gbe8a9TBkdoroPsGFXOaYTMbRTRfSrmjboxQgdkem
        QnhL1xWr27CuISe2r5t/QVVFFyvur7V5qRJ7NslUJys31WaCa6sHe2wc9Fa18E7Un+Kfre
        s0KoBck2Q7ifV7U11uQZlu/1pEkC1Vg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-5agTxt-WPvurIxg75FdeIw-1; Wed, 18 Aug 2021 08:53:12 -0400
X-MC-Unique: 5agTxt-WPvurIxg75FdeIw-1
Received: by mail-ej1-f69.google.com with SMTP id j10-20020a17090686cab02905b86933b59dso820957ejy.18
        for <linux-watchdog@vger.kernel.org>; Wed, 18 Aug 2021 05:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SLP3QDMix2Fy2z/XbxkaOOGCVei38kfmJ4Q+cqGq+BM=;
        b=ufp9K34cCOmRA1RLKFezLpD0yCQLEJ1YBkEnUrvGqeCMgcTomFjucuplmnWnE1xUBD
         sg4UbLwDT8nR5vPYykWfyVGaaaOPMKzh+ImlDz9LvbEw+mW2nozNcZtW900h7NlYWn4s
         lVJc70jhz4xLDKk2x2uF+1NrNL2M0eiSkhykW9Z+5DZKXhaI45j3IjePlUc5SQ9OwUeM
         KFnlTOPiKgjfMSO220vpRExeCObZChohY4hgrVAliIBOB7gfPqYYwLLITD/dHLiMla0S
         PVEvxFiyxxL0kd+AtCxH6ilh6RZ0ptWkxPlOypZsMAw3aPDSA4ymxlZt4m2wuW6QO2Q2
         W9Dw==
X-Gm-Message-State: AOAM532xvsfbn00cUzhI+ihtjaTJKfBQWUUKfJJYcYeqnBJHu4rnCfQN
        znOhWomEArHUDQJt6dC0xIkQBeKha8nOEH/E/Fy4TXRBo7xe8CSa9OSaAgxX9CKatOUklny4IpF
        9Kzf6y9urHQeAH7/xnVdhteDZpBI=
X-Received: by 2002:a05:6402:1850:: with SMTP id v16mr10308530edy.308.1629291191192;
        Wed, 18 Aug 2021 05:53:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAtwdZ3u547e115Bv8O1wT4K6b7qTRod3JgmU0ZUsze39BljrcL0Bxrz76vzYST/jjsQeuaw==
X-Received: by 2002:a05:6402:1850:: with SMTP id v16mr10308512edy.308.1629291191039;
        Wed, 18 Aug 2021 05:53:11 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t25sm2594887edi.65.2021.08.18.05.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 05:53:10 -0700 (PDT)
Subject: Re: [Watchdog drivers] - WDIOC_GETSUPPORT clarification
To:     Jose Noguera <jnoguera@redhat.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux@roeck-us.net
Cc:     Peter Robinson <perobins@redhat.com>
References: <CAKu6O181WOq36RCDO0VPcsZZoUFAJ88BMqv0Hqf+qYCeZsMJtQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a6287ec5-3b44-5a65-0534-18b1ebc09348@redhat.com>
Date:   Wed, 18 Aug 2021 14:53:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKu6O181WOq36RCDO0VPcsZZoUFAJ88BMqv0Hqf+qYCeZsMJtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 8/18/21 11:57 AM, Jose Noguera wrote:
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
> Working with Hans (in CC), we added a little patch (BugZilla ticket: 1993983) on wdctl

To be clear, Jose is talking about this bugzilla:
https://bugzilla.redhat.com/show_bug.cgi?id=1993983

And this is the util-linux commit with the little workaround-patch:
https://github.com/karelzak/util-linux/commit/b1b0259fe42aad1bf0997ce1c03a020ce59e38ab

> and this would be the output of the command when it was a card reset triggered boot:
> 
> $ sudo wdctl
> Device: /dev/watchdog0
> Identity: i6300ESB timer [version 0]
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

Regards,

Hans


