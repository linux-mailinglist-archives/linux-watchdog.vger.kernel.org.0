Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055BE753670
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jul 2023 11:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235577AbjGNJ3W (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Jul 2023 05:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235609AbjGNJ3V (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Jul 2023 05:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EAF2D66
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Jul 2023 02:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689326909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e917PWoV2EQP18RF0PKWLGfuOBS2EM7fSGv2w9B6FsA=;
        b=AgW17DI2ov8enRioewE3cTLwSbOOihsNG4/gx/V9ag7B0Cuiar8Vhv7XqN3RhMNaI/5bk2
        8ybZPG6ylQIOFyv3PJu/KcTOhgx3DY/JGR64Pr+RkpIGmGZmduHMYK8ATXXeXFaKTSf+p/
        NcgcRRDRXcmYuRaLVFndvtmlNS+sBPs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-C_RO6UJaMo2c0lKwpxDuOA-1; Fri, 14 Jul 2023 05:28:27 -0400
X-MC-Unique: C_RO6UJaMo2c0lKwpxDuOA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-994320959f4so93825866b.2
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Jul 2023 02:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689326906; x=1691918906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e917PWoV2EQP18RF0PKWLGfuOBS2EM7fSGv2w9B6FsA=;
        b=h7vwK+EcM9Kts9dpSQdFV2JnTdWPVh+2K421gZT4e8cg5hc5XSK6yAI3Jxt2mL0snD
         6Azi9yvChTViRdLQVWQ/P/642eAcMGfk0JSQejqfsrdcoPy66YeAzMA+g7B9ZGK1KZYh
         iek5tiWFw4NjlVekQVNMzL7L7LYX4NrhVYRYOB1TofnRQnWElhnA1SDVkStTrRL1JDeX
         1T0D+1iAPG4KxaajoEL8TMfBCa29asAprI6ovWTpsRCrNzsop3dYaoUjcYZ2VWRdeVA0
         vfbLB1Z6PcxeLaq4l2Ixiaoq/PhVxiFZfPdY6tGzqEhgi3L2DvEpT5DjNRl672WuA6bh
         LQ6g==
X-Gm-Message-State: ABy/qLasRU8x1zsay20B/Rpe+pxK23fOHqISmCYEYYcKEAi9bt4N8Wrf
        bhfFUxtId7I5wmUjL9qT5g0EQkyOXk6/yTYqnlINDIvpZkHssf1SsIG8jd75lf8vBeSkUGnQ5Qo
        WDvwlN05GiyF50Ggoz+VmBfQSxdU=
X-Received: by 2002:a17:907:3fa8:b0:988:9621:d85f with SMTP id hr40-20020a1709073fa800b009889621d85fmr4159781ejc.58.1689326906210;
        Fri, 14 Jul 2023 02:28:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFU+Pc68BnX42o35KIETq90KYLk34BYAn7ZOZ1KHJLjq5Wb9nfi46Kj9Z/2DbOisETUAh4Weg==
X-Received: by 2002:a17:907:3fa8:b0:988:9621:d85f with SMTP id hr40-20020a1709073fa800b009889621d85fmr4159768ejc.58.1689326905941;
        Fri, 14 Jul 2023 02:28:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k12-20020a1709063e0c00b00988c0c175c6sm5173154eji.189.2023.07.14.02.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 02:28:25 -0700 (PDT)
Message-ID: <51386a3b-7a77-a18b-78b9-57f53d4979a4@redhat.com>
Date:   Fri, 14 Jul 2023 11:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] platform/x86: add CMOS battery monitoring for simatic
 IPCs
Content-Language: en-US, nl
To:     Henning Schild <henning.schild@siemens.com>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Tobias Schaffner <tobias.schaffner@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>
References: <20230706154831.19100-1-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230706154831.19100-1-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 7/6/23 17:48, Henning Schild wrote:
> The real change is in p2 and p1 just prepares to multiplex an IO region.
> We introduce a custom driver to read CMOS battery information on several
> of the Industrial PCs.
> 
> This is based on
>  "[PATCH 0/1] leds: simatic-ipc-leds-gpio: add new model BX-21A"
> 
> Henning Schild (2):
>   watchdog: simatic-ipc-wdt: make IO region access of one model muxed
>   platform/x86: add CMOS battery monitoring for simatic IPCs

Thank you. I've merged both into a platform-drivers-x86-simatic-ipc
branch where I'm collecting all the pending platform/x86: simatic-ipc
work.

I'll tag + send a pull-request to Lee Jones (for some dependent LED
patches) later today.

Guenter, I'll Cc you on the pull-req in case you also want to merge
the (immutable) tag to pick up the small watchdog change in this
series.

Regards,

Hans




> 
>  drivers/platform/x86/Kconfig                  |  48 ++++
>  drivers/platform/x86/Makefile                 |   6 +-
>  .../x86/simatic-ipc-batt-apollolake.c         |  51 ++++
>  .../x86/simatic-ipc-batt-elkhartlake.c        |  51 ++++
>  .../platform/x86/simatic-ipc-batt-f7188x.c    |  70 +++++
>  drivers/platform/x86/simatic-ipc-batt.c       | 250 ++++++++++++++++++
>  drivers/platform/x86/simatic-ipc-batt.h       |  20 ++
>  drivers/platform/x86/simatic-ipc.c            |  65 ++++-
>  drivers/watchdog/simatic-ipc-wdt.c            |   9 +-
>  .../platform_data/x86/simatic-ipc-base.h      |   1 +
>  10 files changed, 553 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/platform/x86/simatic-ipc-batt-apollolake.c
>  create mode 100644 drivers/platform/x86/simatic-ipc-batt-elkhartlake.c
>  create mode 100644 drivers/platform/x86/simatic-ipc-batt-f7188x.c
>  create mode 100644 drivers/platform/x86/simatic-ipc-batt.c
>  create mode 100644 drivers/platform/x86/simatic-ipc-batt.h
> 

