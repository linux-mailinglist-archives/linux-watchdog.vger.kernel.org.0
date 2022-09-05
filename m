Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6A15AD05D
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Sep 2022 12:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236600AbiIEKlM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 5 Sep 2022 06:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236498AbiIEKlL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 5 Sep 2022 06:41:11 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27CB4BD3D
        for <linux-watchdog@vger.kernel.org>; Mon,  5 Sep 2022 03:41:07 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id qh18so16198787ejb.7
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Sep 2022 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9xdYuu62zn6DTVuFLIdNqNTZMNwzsKHXEqC14OZNWNU=;
        b=FtboF37GSOE63UVBPDmVZNlKbNYdyQQTJ+s3UhSQJVLQL/lfTP9LWjRJrI2IirL10P
         RMbzluYFwNJzfe1PcgqLCwlKFYldMq9paXhxYn0sYX271CaSDJZHidZ5q96JxBOSW2zn
         lOaTLbWVAi26m6UIISjWArsPGILqnhZGi9fcT8kQksgDAK0cglTE62X2uT7bK8xfV6Jn
         69jfdmKiWiZCu5sVLeXkE7kdKvJZrfswHvHuNhGjcoCD973h5vcRXPGP0giAbPSsgah9
         jm2PSTYF7H/HxnDS4XHxekgDOaHjJVatxbEhAECSvMHM/cKDnbe76RrHLb0Ztl/YmXn8
         00eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9xdYuu62zn6DTVuFLIdNqNTZMNwzsKHXEqC14OZNWNU=;
        b=uATx7wzICNoDjcBudP9G0OLQHbdV6YGGbcgtpN3qjsCjKRsRZjV75TdLHMFHuTknUL
         vCSd7N8bhkdUOI1Hbluik5pD6IRbH5cLw0dccD/gaH4gRMGAd8UrwN8ojL07OrIKWtws
         sTEp29/Tj7RO/5AMIQwqaj+2cd4NvV1kMBIsRCMg30gjeERQ1us9BdMly+FcLwZKFG5V
         mKQ8m56/HhaawpT993RpAenb9E5Yzp0xyVR4seF54phzsRn6TrqpTtg2E83K843VEOqw
         Lzy1FpKuQBXoiMnE56B35m9wAjeT79SQSuHxaxzwy3EtQfTZvl8CLlEr8K9zSJsW2ZKm
         5ycw==
X-Gm-Message-State: ACgBeo0FgLiioy4koalOHRpqD0KjmIIiirvjOnNE6O2NP57aRboQ5BnO
        0W1oMfPojhTne8Br/TlHFft8G/NjrHSLEo9Niv61eA==
X-Google-Smtp-Source: AA6agR5WFwFd/TQ7W2jnfHYcXDAkiN6tuxUzvxuNvMwW96MkN6StF/cPpx6O6HJW2jg3g8odW82qLRa+WoEMj2LUhdw=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr35853646ejs.190.1662374466240; Mon, 05
 Sep 2022 03:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-11-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-11-b29adfb27a6c@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Sep 2022 12:40:55 +0200
Message-ID: <CACRpkdbYc3vbgq26cXz4FYdzgDp-ro3fq=JGmuj9=cq+Zu13PQ@mail.gmail.com>
Subject: Re: [PATCH v1 11/11] gpiolib: of: remove [devm_]gpiod_get_from_of_node()
 APIs
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Sep 5, 2022 at 8:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Now that everyone is using [devm_]fwnode_gpiod_get[_index]() APIs, we no
> longer need to expose OF-specific [devm_]gpiod_get_from_of_node().
>
> Note that we are keeping gpiod_get_from_of_node() but only as a private
> to gpiolib function.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
