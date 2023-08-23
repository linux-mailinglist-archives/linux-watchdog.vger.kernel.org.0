Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B81786212
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Aug 2023 23:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237342AbjHWVQ6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Aug 2023 17:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237881AbjHWVQs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Aug 2023 17:16:48 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D31171F
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Aug 2023 14:16:35 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d665467e134so5995523276.2
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Aug 2023 14:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692825394; x=1693430194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEpTjrnLVqxen66G7Uvz7Jyy/E11cVlVrjCW6/VyKj8=;
        b=ZDmv2BjJU3fBSftYGcNM3tb+ILU/d9+cLODcLN7bJx5jE0GqvFKrPnlSYGlL0k9kWu
         m0bch7za38IJ+CLWsWjflpljG/O8F9HEsNE/VWjVNStBDOBq3iJDnH2eTLO/dJEAtALA
         zbXY+4ZWcbcUYtwqB7UctSATyz1sDYmgfZ/uZj88iB4dhaAHsNB4lm1XJShf+lSlTUF4
         q1mw8cBg/PsTLqlxfYRQ9OdT1JyBSqfrgsLuehUHu9V36ypWdR+RMX9JIQmW7yxqcnfx
         Bu1+6uVlgAFqvayOjaJa8cEpXa7Hm+cDiofeMeKPmewLASFqzTHTuUzB1cC9zTcv8uzK
         +bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825394; x=1693430194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEpTjrnLVqxen66G7Uvz7Jyy/E11cVlVrjCW6/VyKj8=;
        b=WzzyTN14kqYUtz7fJ4RhSa3qj8SEDV6yjaYXUGz+TzDjYduWTB/KBq7SBDovHETssG
         +JrNhQfI7TYCFvxw6n7jvxMlI45XuOnub4+2AJAbDzn/NYgJEU+DjPbexDPfkJZV54+4
         kaF+90NcN3jnccGUpjNgsXGviruKzsTVa1vBrDoVF6hUEc//PK4pJ+MuZpxpGjL7amU1
         PyiCTEW73XSt1+rE+E9K8AroMmJurIH/g9LDdDZbW5g0XbIa7x7LUgMr79dBNdV1HGgo
         ioZGiUYbfHz7T611g+WUofzxVoZQZ5A3bIHq7M/hwiHrn413qyO+CN3O+ydzMiICKpGo
         KQJg==
X-Gm-Message-State: AOJu0YyWpzB3NI5ZKioEGkvyO1/mrwBfN5RaLlZZm3URnpOwcgU6cPY/
        ynQL0PhCmAXkd85DICI3+baRdr5VwiE5h/nrYGj8bw==
X-Google-Smtp-Source: AGHT+IGU5hlAbzjKR6dHf8nG7wjH+gLTIhLdkOAR0BQZYCAzmvxO+0vsobrLpwu8+6G8uJRZXAov+P50unjaO9+ZE7g=
X-Received: by 2002:a25:c08f:0:b0:d09:f39b:cecf with SMTP id
 c137-20020a25c08f000000b00d09f39bcecfmr12862557ybf.9.1692825393910; Wed, 23
 Aug 2023 14:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230823183749.2609013-1-robh@kernel.org>
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Aug 2023 23:16:22 +0200
Message-ID: <CACRpkdbuB-NotnMXc9vZj-byjk7spCSkZ+Dx=R_eOqoSV5CdTA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
To:     Rob Herring <robh@kernel.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Corey Minyard <minyard@acm.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        M ark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
        linux-iio@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 23, 2023 at 8:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
