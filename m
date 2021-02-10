Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840D8315F4A
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Feb 2021 07:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbhBJGQq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Feb 2021 01:16:46 -0500
Received: from mail-lj1-f171.google.com ([209.85.208.171]:38052 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbhBJGQk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Feb 2021 01:16:40 -0500
Received: by mail-lj1-f171.google.com with SMTP id f19so1335232ljn.5;
        Tue, 09 Feb 2021 22:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=j4G9EDf26Spz2kpabHzZmd930E3NJmkDL0N+wwadLRs=;
        b=ga20xkqhZAWtk5OhkltF6gXu/IuSXpOMf7ef2lGR1hJyxxrgLrPLceaycx8rwDHxRG
         3msHwXUYCsoqZCuF4d4EP2m/WYVwL7qXzDp7Lm/Y6CdvreDbCjI4S6zXXfmFbuPumm0q
         Qf4n+3ZNJCHkl++uc42gjqb0kNW/rQ2BQSt9Iwvwqr9GWXF6YPICQZnQRdVENIQBr0p2
         q+mfnFeVp4nhckGGRV43BsmCA53ZG1wQ0BVcEsnqX+vYc2nGSX+/9ybNDpio9GGHuywD
         PaojJRFSPCtbRI8c63PZEMFhMzhWAV6tKgjzIkGUGANRhNP/ZOhPAQgOeouIowOX/Otl
         YgDQ==
X-Gm-Message-State: AOAM533Vdut+IJULxOyMxAKIk/5XkIy1Y6MegT0Y3tWSpboBhSq1PixR
        HlVcZXixKXacTgVKF0uVziGEJPEwy87Gyg==
X-Google-Smtp-Source: ABdhPJxtGGxJVAVTpKZLEkSXxldgTXWVMJ524tVQz+HX0vNwsESuMTY0xEs99AH1fvisI+u3oGDQbw==
X-Received: by 2002:a2e:a590:: with SMTP id m16mr997787ljp.325.1612937751147;
        Tue, 09 Feb 2021 22:15:51 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id i18sm141355lfe.177.2021.02.09.22.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 22:15:50 -0800 (PST)
Message-ID: <79e133f33ed9bf03b255aab00542d360ad91174c.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v7 2/6] mfd: Support ROHM BD9576MUF and BD9573MUF
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210209145507.GA220368@dell>
References: <cover.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
         <185621c77e5eaecea239e0146ea48bc7a2648b9f.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
         <20210209145507.GA220368@dell>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Wed, 10 Feb 2021 08:15:44 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello Lee,

On Tue, 2021-02-09 at 14:55 +0000, Lee Jones wrote:
> On Fri, 22 Jan 2021, Matti Vaittinen wrote:
> 
> > Add core support for ROHM BD9576MUF and BD9573MUF PMICs which are
> > mainly used to power the R-Car series processors.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> > +
> > +static struct mfd_cell bd9573_mfd_cells[] = {
> > +	{ .name = "bd9573-pmic", },
> > +	{ .name = "bd9576-wdt", },
> > +};
> > +
> > +static struct mfd_cell bd9576_mfd_cells[] = {
> > +	{ .name = "bd9576-pmic", },
> > +	{ .name = "bd9576-wdt", },
> > +};
> 
> What is a PMIC in this context?
> 
> To me a PMIC is a bunch of devices.  What is this probing?

I agree. PMIC is the IC as a whole. This name was not the best one. 
> 
> Maybe this is *-regulator?

That would be more descriptive and I can change this. However, it means
I need to change the already applied regulator part too. Furthermore,
all other ROHM PMIC drivers I've written use the <part-name>-pmic for
regulators and so does a few other drivers at least for ICs from Maxim,
Samsung and TI. That's why I don't think the <partname>-pmic is that
confusing. If it was my decision, I would stick with the pmic for the
sake of the consistency.

+
> > +	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, mfd,
> > cells,
> 
> This nomenclature is confusing.
> 
> cells and num_cells would clear it up.

I can change it.
+
> > +#define BD957X_MAX_REGISTER 0x61
> 
> Nit: Can you tab these out for improved readability please?
Sure, no problem.

Thanks for the review!

Best Regards
	--Matti

--
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland
SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~

Simon says - in Latin please.
"non cogito me" dixit Rene Descarte, deinde evanescavit

(Thanks for the translation Simon)


