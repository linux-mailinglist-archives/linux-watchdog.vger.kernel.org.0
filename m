Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC7D6173BB
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Nov 2022 02:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiKCB1i (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Nov 2022 21:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKCB1h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Nov 2022 21:27:37 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A34B12D35;
        Wed,  2 Nov 2022 18:27:37 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-13bd19c3b68so615237fac.7;
        Wed, 02 Nov 2022 18:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lhguKZm5jAB5EIUo+yucCqXNy+ZxkwH9pcc4FM1ikf0=;
        b=FQaxtMANFxwLPCXqqIUNJSq8p3LlPJ/h6+13H85RwW+Cj+vGtW9Dadf/fIM9WHjAfH
         4eCUFD4MjOAARBjuba+u6FC83BB1VrzFS4h9Or/2EhIvq4IbXZ3JCu3vzbonInja/4wm
         A21lPuqDp903NHVhbjp3qAIPGLWXvcLDLbyRCQSnYRXY1FjutXL4ESmKbpEWJZSZQPbh
         B4OGTQ1K6MdOvR85jL55EfZnyXmNdyLSLXPKKFAq0G7M9dDcx5QkU5sqBf9qrgQYy+oO
         zWjS9ZzEj2J/Zz4VTAxIN0zNTcea3i867VvTzrlphv48Zv1h8LMB1EC+vmZZWgovoUq9
         Swbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhguKZm5jAB5EIUo+yucCqXNy+ZxkwH9pcc4FM1ikf0=;
        b=qqwRfn0uJFtg/jBpAW4Q3DBpVrM+L0qlO7RgQpwfwke5sMEq5Ol1LBt13hFfnaRpAd
         LyMhlfOqk2Fa3qWQdTAdF6/LFyIOk+pjYqZnMJ2x7I6Q1BKyyGutLiM2Sdh2l7ckbWU6
         aRV69U+wvEtqz4NzQtBR9sBUlJzAwRUQP+k1ZKI1ysKh5nPPqhRqUBNAoQjXYosAMTPH
         I7FPAtRpP1rBDQD3qi/BbdNjEGT77BLqOU0rsJLQ9vCA4A6pgfcG84vvOFAihmOCVh/w
         DDZo8QZx3cmBks6jOTm0n5V77WkW9mKiEZGy2klDmoIqg5lFmesFikjVqxM3E/7qlRmX
         qFiA==
X-Gm-Message-State: ACrzQf1wXdjx6GXrBC/Ce4nQIENg6FgtIkmjKdG+Hw6PKjnaJazn9nFu
        W9OwQFtSubdmPZwr3yXXbevU1WXS/wk=
X-Google-Smtp-Source: AMsMyM6T2dv6EpLuKLqUbHnVAzTcQqBAda/fOk2f+fg597z0ZYDakkbfQ1tlzAW9sCCNVwr9P7+TCA==
X-Received: by 2002:a05:6870:d584:b0:137:2c18:6864 with SMTP id u4-20020a056870d58400b001372c186864mr15744148oao.245.1667438856458;
        Wed, 02 Nov 2022 18:27:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j29-20020a056870169d00b00127fbb7afffsm6841023oae.5.2022.11.02.18.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 18:27:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Nov 2022 18:27:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: watchdog: gpio: Convert bindings to YAML
Message-ID: <20221103012735.GA2109982@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 02, 2022 at 11:05:30PM +0100, Marek Vasut wrote:
> Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-watchdog@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Add missing required: properties
>     - Drop quotes around ref: referenced schema file name
> ---
> NOTE: The Maintainer entry should likely be changed, although it seems
>       like this driver and its matching bindings are now unmaintained.

Where do you get that Cc: list from anyway ? get_maintainer.pl on both the
mainline kernel and on linux-next tells me

Wim Van Sebroeck <wim@linux-watchdog.org> (maintainer:WATCHDOG DEVICE DRIVERS)
Guenter Roeck <linux@roeck-us.net> (maintainer:WATCHDOG DEVICE DRIVERS)
Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)

Why don't you copy Krzysztof ?

Guenter
