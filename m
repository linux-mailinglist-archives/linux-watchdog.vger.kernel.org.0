Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9404AFE83
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Feb 2022 21:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbiBIUeH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Feb 2022 15:34:07 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:37504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbiBIUeG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Feb 2022 15:34:06 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0F5C002B5D
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Feb 2022 12:34:08 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id d15-20020a17090a564f00b001b937f4ae2fso1047810pji.4
        for <linux-watchdog@vger.kernel.org>; Wed, 09 Feb 2022 12:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GlHFJh2a2xXvyCbT4kOTSilCcLmn3e1W/4SnmESt0MI=;
        b=lplYOe20SzQGxMRON+NrjSjmly/0H54vhtjjgDP1fQvueeBucx3aIl6nhluXzAyAwk
         2NP+FHp+dBxmQJlee/GPFIX9z5eypQYGNefv/6f16lBTPz1hk1fW831JrcNuwfkX+mnz
         Ow1/EtLbTjaBWz26ql70WQKw08nNhYWtyI6gKu/0azJyJcrGQfj04FhfdfGCnVtveOvP
         TOZSeY8plAg8p1SAERZWp7SkZfqx/tNrtP5I2YrQD1BnvULKSNAQpbdvNXs6RYDYIRMV
         g/hbM4xOKsoEJJfm+jX4wfEuiso4/9cH0XR4x3QDIB5UToC5Labi9GioIoVhTWus21zu
         gVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GlHFJh2a2xXvyCbT4kOTSilCcLmn3e1W/4SnmESt0MI=;
        b=ESYeJzmxSAYzvzyiZRSYaxHZesk+kO2qh2dyTnI+pI2mlgsRwvlld0G4x714FB6ER0
         +2oHXPrlqe3yb5JlNUgB4KENNJ9k5fM8MK9l6KTA7W/rskb3jUTMvXHQcEJHmTeSuGpn
         wNq8qK0KEKHcSdBbUx7IQzU89fJWfjtMl2FGSTiMTeUrNudETI5/IryarWjYsANOGAaD
         AKNWYE0lFRmtkh+vIU6FACYftVVJ8kirbYZGXwJFZCOY2z8L1Bjpg/SQ3dD+O1qjOW0J
         OEbAk916uOUND1rOLduRzmEanmwsHNgVwZtbNwLkBfIoVMaJAeVkwvZ2VIH1KVDT74m+
         KFzQ==
X-Gm-Message-State: AOAM531q02VPAMaeH4RjBnupJG4BL1tXWZpnWsFYHhHBu9mMdLIUK6RZ
        FlYul0l2CKF7r9jWZ3yfIng=
X-Google-Smtp-Source: ABdhPJzDfyQUVPu7jGXmdltD7BCWlXmfKhuoZB9IzKeIl3Q4rHe+iV/NnvxOe8WHjdJIN+oLwM88tg==
X-Received: by 2002:a17:903:1ca:: with SMTP id e10mr4129019plh.138.1644438848164;
        Wed, 09 Feb 2022 12:34:08 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id g19sm2406410pfc.109.2022.02.09.12.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 12:34:07 -0800 (PST)
Subject: Re: [PATCH] watchdog: allow building BCM7038_WDT for BCM4908
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220209203202.26395-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e8034274-6f02-77f6-fe2d-1c29f5242c4b@gmail.com>
Date:   Wed, 9 Feb 2022 12:33:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220209203202.26395-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/9/22 12:32 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> BCM4908 is a SoCs family that shares a lot of hardware with BCM63xx
> including the watchdog block. Allow building this driver for it.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
