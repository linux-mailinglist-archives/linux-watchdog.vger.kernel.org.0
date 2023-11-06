Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752C67E294E
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 17:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjKFQCN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 11:02:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbjKFQCM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 11:02:12 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F577118;
        Mon,  6 Nov 2023 08:02:09 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc5916d578so42122485ad.2;
        Mon, 06 Nov 2023 08:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699286529; x=1699891329; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L87RYpGTy0Ae33Mi4zqQxq7EiaxqOB5FDX6HtYxP6hE=;
        b=g+8ZpZ5zGBQ4NHgvgWXv7y4x6h8T3k7mmfjE99RoVfiZbzXfZWDaNIRUic3sO0QpnY
         y5Q8YN0tyEzLFVeTNNa7tj73FYyrZirPrEZ1R9ZjKrHnNWW+ClwWc2fFJsA5CsM7Eg17
         6Q0ihvA6xVgLvkW7CAVqIU5k+UNmf/9CEHDFQGnSIUokdfgACO3ciwTVKRsZ4RFgBvZq
         ofEKTzz7A+YABvMvwikQozBd/eSRD4Gh7LEb27nVStVSSUWMmQIFP6T8kh4W979DuAcC
         m8eAjdBkZe/Ai2wMDulRWAjFN1pyDI1u11Qjcfb98TA1hx0VO+MLSBimjphiQVQ1JsLo
         Nolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286529; x=1699891329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L87RYpGTy0Ae33Mi4zqQxq7EiaxqOB5FDX6HtYxP6hE=;
        b=nomEF12Q97IX7JetWsxG1z5g4wCyG0xHeT7KTGgXTpAOPwxWWcEkINPSR38LgT6g27
         Kv7kuYtMofODOKA3wrfdtG0HIoETxMxDwe0utFBq/XbjDcseivnSzMR9MgN+q++Z455w
         KyxmGWMbAnSJvl6ulubqKV5RI85727CODXQxmCpqSEuG74ImiVzjDhTjaK2lPNP+gDi+
         FGtfcDiXAzLg22NsMEHs63kjLtivwF4pIwbA/56MaxBYB0wsLBk9+ASPNSFXfaUaGtN1
         xdVlvLbl2UOJP6OeywvUTlhHv02fkpwOslIW70eMWgrlH8391qkJ1fDyHm87bAmEub6O
         tbJg==
X-Gm-Message-State: AOJu0YyMnqDQweNFUoF6VRj6eP7u/UiSkmhhqA05gi7/ACkDFVPm672Q
        R2GHAjgTNVJahE3YDMonRhOgimkIUHg=
X-Google-Smtp-Source: AGHT+IHQGgctmXawzcww2AzdrLgNMEulMDEuhToh+t5eFz4R1sg2J0G3K7a6ChDVmK2Xr/KHC5goog==
X-Received: by 2002:a17:902:b489:b0:1cc:be6b:80fa with SMTP id y9-20020a170902b48900b001ccbe6b80famr5846220plr.12.1699286528722;
        Mon, 06 Nov 2023 08:02:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b001c6187f2875sm6085252plg.225.2023.11.06.08.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 08:02:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 6 Nov 2023 08:02:07 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/5] watchdog: txx9: Stop using
 module_platform_driver_probe()
Message-ID: <8b47d0f5-bfa8-434a-9abe-d2f7e9eae917@roeck-us.net>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
 <20231106154807.3866712-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231106154807.3866712-3-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 06, 2023 at 04:48:10PM +0100, Uwe Kleine-König wrote:
> On today's platforms the benefit of platform_driver_probe() isn't that
> relevant any more. It allows to drop some code after booting (or module
> loading) for .probe() and discard the .remove() function completely if
> the driver is built-in. This typically saves a few 100k.
> 
> The downside of platform_driver_probe() is that the driver cannot be
> bound and unbound at runtime which is ancient and also slightly
> complicates testing. There are also thoughts to deprecate
> platform_driver_probe() because it adds some complexity in the driver
> core for little gain. Also many drivers don't use it correctly. This
> driver for example misses to mark the driver struct with __refdata which
> is needed to suppress a (W=1) modpost warning:
> 
> 	WARNING: modpost: drivers/watchdog/txx9wdt: section mismatch in reference: txx9wdt_driver+0x4 (section: .data) -> txx9wdt_remove (section: .exit.text)
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
