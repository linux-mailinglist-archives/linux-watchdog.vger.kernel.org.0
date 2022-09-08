Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6315B1710
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Sep 2022 10:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbiIHIcl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 8 Sep 2022 04:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbiIHIck (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 8 Sep 2022 04:32:40 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33DEDABB1
        for <linux-watchdog@vger.kernel.org>; Thu,  8 Sep 2022 01:32:38 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id go34so1314970ejc.2
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Sep 2022 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jfNxp3kBTvkWQp+z++yGCicLFIdP3WSDrE1bvSJvPmY=;
        b=N7OrHuhPmgpLtKe7tnHDZ7RwDs9JtGDJ1pEZAugqax5yV6+dKsP1g39dwektERtKK9
         CqiUuFQqXSSuUbo+lbqds7kHNQyuAL/Veez+V9HFOwJssWjKLEA54Jx+xvOnWdZg1gU6
         JOxfP/9/NxYiQrnLd3UxjZHv8TMQ+wgHt7KdSXV0V6cbJmW4D2Gwb7ov2pd9SlH66fj6
         WijmIrNii/pRVcLStzTngeZFuroX0sCBHB94+ZwmirZBSIfw1kFdXAtYlaSw1bazNWqB
         9cSY6xpglQGMGo0jkZGZJzkv20FP4T7zRyAO/IH7JbUYsvCN+q3yaVGE1LQNbtGUJdZX
         OmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jfNxp3kBTvkWQp+z++yGCicLFIdP3WSDrE1bvSJvPmY=;
        b=P2XLqMmu8gohpoxWNk1JztL6xnjh1yiTWVX+ikA0oHcnPkxyr3SfITumqheVaGguHL
         tdpRCrYkHApuLVMksBLm3DCqhJ/tmKFbYOsLmhFzYA82shtShkTt8BPTtUYTP961P61P
         b/K8BueA2zPX2ZB4DXsi7LeWhpfpYfKvIqzUstUN1v5nnGdRPWcKoKmcmKZDq8jB5OEc
         Sp198qSJ6RgRKZwppzEdRIMElODsYTcMSDNnrHGEZHoikxAvIrnTJMyv6Rj1q/bOiXak
         9TLjXVP+gpn5ukP3Qg32TJNq8ueYWEv0rcskl99JFmGb8X5fXqMuU89jaSh8uqpEKUGV
         IpDw==
X-Gm-Message-State: ACgBeo2eB85Ggm3Ui0DvjQIWIZXfeChvm0+qzmhUrlQuauIkRgqlHVdy
        iZy1FRMxudKlQBgR4dDT2JZuz0Zp3Ien0+sDfMkDKA==
X-Google-Smtp-Source: AA6agR5Pikao0PJyi3RWxDK9ckpLNq+5mIIPSLz2103lmxoJTGOdaR+FFIYnzUMOtVhVwUgnD2qSZsn8UUkJGH1BEqg=
X-Received: by 2002:a17:907:1690:b0:770:80d4:ec4c with SMTP id
 hc16-20020a170907169000b0077080d4ec4cmr4628049ejc.690.1662625957353; Thu, 08
 Sep 2022 01:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 10:32:26 +0200
Message-ID: <CACRpkdY_TrA7DB1AkQhNALbAdMdw+T2PkA4+s9ORUNAA--DZEg@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using devm_gpiod_get_optional()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Felipe Balbi <balbi@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Marc Zyngier <maz@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        David Airlie <airlied@linux.ie>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Sep 5, 2022 at 8:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> device property API.
>
> I believe that the only reason the driver, instead of the standard
> devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> because it wanted to set up a pretty consumer name for the GPIO,
> and we now have a special API for that.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
