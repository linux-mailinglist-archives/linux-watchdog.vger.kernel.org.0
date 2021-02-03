Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7D130D66C
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Feb 2021 10:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbhBCJgy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Feb 2021 04:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbhBCJgt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Feb 2021 04:36:49 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E4DC0613D6
        for <linux-watchdog@vger.kernel.org>; Wed,  3 Feb 2021 01:36:08 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id m22so20055227ljj.4
        for <linux-watchdog@vger.kernel.org>; Wed, 03 Feb 2021 01:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6GnRcNKibxztYcvUQzDGCgHL6AviuIrNT8YjYqp4o+g=;
        b=FULorK8vsWlfT9sFbadP6z4zJxOs9AiVRnvUe7J2rfjR8hquBrIAC9NlypGz9UeYow
         fXSHbY/48b4B5FIWctnJBzdDTMZq9tEReP6vEhxmitTovmHof64D1sG8EOw5cefbG83b
         b6WHunVOHISOl9wNdGRCjou+X/7CDB2GZGoy1u48n6WpbKI7eHXwxjaSrEfO+KrQAeGa
         MiIrxSEsA6COQt6+e85FcGXmmkpNbcJ6g/AC8Pvg2DqvXoSiLe8ytw/3OA8kIkmwOMSD
         yBCRLiGLJ8rT5lH/iTbOBidfsCnzjchOZKQeN/OhXQqHkDq0+TtRW3ouM6MyzaxbLyzz
         Rqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6GnRcNKibxztYcvUQzDGCgHL6AviuIrNT8YjYqp4o+g=;
        b=hLs4yDvBov/dvtZGcgBmBVyGoz7gf/dqb6w3Z3WnfvpyBXLE4qbwph1pMgv6U6iE9c
         2lro+0vYSyKjnUcGgUtgcNiLI9u8dJQmv9aP6rnQN+T9YFaML8nhuIAIaOgfVdIfGBls
         waWEKQAA5ZQy3o2sKqhTXoisqGyePJaqlTF5dfLiD4nz/ObQd+drydYKeEPkyuKjrWtx
         bPSlqm2taNlUnqOJa0CxZwg6J13yvmM7AbaYXDRDzmqLWYV0J52npfx3ETnhHiur2+pf
         1Lr2hkFisCeC8j8qB92TcfGEFCkl6l/pFuDoKZVmnWbNJj33meBfcDj2Ngc2yuQ5m6yM
         KJvQ==
X-Gm-Message-State: AOAM5320HP4CtyfTlryMe9FvEGlNRBSoFkMR9lYiqqhaMq+JHNVq0Hcl
        D94mqqcRW+6IotjH7azQp+XynNbmuu8nkoRauHloGw==
X-Google-Smtp-Source: ABdhPJy4FflXpUjChVW+K6gb6Ck95k2cKDdhJLsDyahupxAN2akbTAdmitGaAnNIhYk43WdM7SiuRSAXZjsbLKYTmG8=
X-Received: by 2002:a2e:8746:: with SMTP id q6mr1238712ljj.326.1612344967044;
 Wed, 03 Feb 2021 01:36:07 -0800 (PST)
MIME-Version: 1.0
References: <20210202205544.24812-1-robh@kernel.org>
In-Reply-To: <20210202205544.24812-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Feb 2021 10:35:56 +0100
Message-ID: <CACRpkdZF1zvykXj58oKjBVqomH86BSW8N=noDs8q3BA--CLAvw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: Fix undocumented compatible strings in examples
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 2, 2021 at 9:55 PM Rob Herring <robh@kernel.org> wrote:

> Running 'dt-validate -m' will flag any compatible strings missing a schema.
> Fix all the errors found in DT binding examples. Most of these are just
> typos.
>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Daniel Palmer <daniel@thingy.jp>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Vincent Cheng <vincent.cheng.xh@renesas.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Ooops.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
