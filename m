Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2429A7CFA7A
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Oct 2023 15:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbjJSNLK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 19 Oct 2023 09:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235383AbjJSNLJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 19 Oct 2023 09:11:09 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF78115
        for <linux-watchdog@vger.kernel.org>; Thu, 19 Oct 2023 06:11:06 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6ce2bcb131fso279309a34.1
        for <linux-watchdog@vger.kernel.org>; Thu, 19 Oct 2023 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697721065; x=1698325865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jm6DMSO8fMKHAOH/Ts5yTawuQ5qbJzgnz2SgvPmjiJE=;
        b=BB/ERAskv535SK29Cyt2aDn+ySYPGvQFbp+h+u9LxFu/8gF4N1X/xK3KXw4yVlS+Gm
         9mVXBQQecNRr7cmLDiqp0pjz9m2OOz4BaZIiXW9+2SR6uGPmwmBo3xq6zAPOs3pXvFMY
         ACc84rVcih8wFCf02VlgNOu9JpEcAfALwipSV3O8mytmS4fMHj2stlXv7Q2GSW8uAPAQ
         KrXPq0hccZIn5nS/38wW2ZQ2qOcnDog6yzezxvrOXh2UysktarYAGSw5w1Uhyx/4C9yI
         0v+JJYTi/6elWx2YJwXqUxSA9HsUbez+Jpmu25nCy4KzqnaJlp+sYhKXo3XvGpyOMxwe
         Yovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721065; x=1698325865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jm6DMSO8fMKHAOH/Ts5yTawuQ5qbJzgnz2SgvPmjiJE=;
        b=Bv9ruJVwE7T6BsuCBiV/w/yb7qqmfP4MEX1u5JFRTf4V9AF2rGjE/3O4IVZhs+oat8
         QJ4hj7kkjXogbxyGzmT8ahMFdHXPvdNCxFUvLEmrXBaampkjklOsc6+AHcCs5TigYQ0v
         7tJR6o7E32wO+VUaY3baee9kLNW4aM2LHhBx5eY2zBaH10GMgBTj4kPrFYveiCDzcSKE
         5lTDLxXD9SiWQ5eSnSUGQDXClummIZ06622jrn8xD1kcdtSu8ST3lxb43vabg4kMhE0O
         sQ+EF5mYljXon27pxuEIIqSFxVy3vOeFwm8ih1qeUOEaWUJdTqTl3gOoClpz8985FlbE
         wlnw==
X-Gm-Message-State: AOJu0YwhaiU7e+MxOfEtp49hXDVbfAFGygiiMy5KHKHUbRTfC/rWWbrm
        tXV1+C5cEWw3IQRbvTttGGJu62VWcTnGjP1aM7oDDg==
X-Google-Smtp-Source: AGHT+IE/jHTUAAR6nIMpfuFVHDcoOayI4LJaNRr2xjsoB7z11oXnUYLoafVN7xD+i6Z21o/jjAiy3LIc6fQpznqcdbw=
X-Received: by 2002:a05:6830:438c:b0:6c0:f451:ab6a with SMTP id
 s12-20020a056830438c00b006c0f451ab6amr2505339otv.8.1697721065336; Thu, 19 Oct
 2023 06:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-4-peter.griffin@linaro.org> <20231016133649.GA2641997-robh@kernel.org>
In-Reply-To: <20231016133649.GA2641997-robh@kernel.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 19 Oct 2023 14:10:54 +0100
Message-ID: <CADrjBPo8xYQtR5qyLPgcUU4VKE9Ecfrb3XGKX4BV8CBLggJE0g@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
To:     Rob Herring <robh@kernel.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Rob,

On Mon, 16 Oct 2023 at 14:36, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Oct 11, 2023 at 07:48:06PM +0100, Peter Griffin wrote:
> > GS101 has three different SYSREG controllers, add dedicated
> > compatibles for them to the documentation.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > index 163e912e9cad..dbd12a97faad 100644
> > --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > @@ -30,6 +30,12 @@ properties:
> >                - samsung,exynos5433-fsys-sysreg
> >            - const: samsung,exynos5433-sysreg
> >            - const: syscon
> > +      - items:
> > +          - enum:
> > +              - google,gs101-peric0-sysreg
> > +              - google,gs101-peric1-sysreg
> > +              - google,gs101-apm-sysreg
>
> Alphabetical order.

Will fix

Peter
