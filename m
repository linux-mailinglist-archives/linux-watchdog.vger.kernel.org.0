Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B16834F68A8
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Apr 2022 20:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239985AbiDFSCX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 6 Apr 2022 14:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239814AbiDFSB6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 6 Apr 2022 14:01:58 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00DBF1FD565
        for <linux-watchdog@vger.kernel.org>; Wed,  6 Apr 2022 09:34:38 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id h16so1872762wmd.0
        for <linux-watchdog@vger.kernel.org>; Wed, 06 Apr 2022 09:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H/+oJ8TjZVOd1l75IwzMMMXtvl7GXkrbfQ+DzHiFQYU=;
        b=BMwxs+Vef9vLfaw6yy3+lZv2gw/NvY1Ch0P1iCzk84RmbzDKCWJPYIR8WNlr6XNKDO
         QItKWXjhGTc1KHbw5C0A26WCg2ntg+4lA+vCMtJ3LnKvvDKxCnJCD+Ns08p3dFfu5n8S
         ozafxpD0PkXVLgGuXBUd1a1SrWkFbV+K9nw/ozkJAh5hcPG0tK7ruX3ZzEPnqxI6fIVk
         GAOCfcuRGPHuvVbVNUf8I8KmQ3qMkfDKpLP4mkv2KkDAoLbt9SvODQo+SvE4rxiOPSy4
         i+/BsJxCveTtTofLob7zly8NBOJyAadC1dkDhkkJuMjFo0KjPRPcJZu0yxBsK6YEJU5B
         nG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H/+oJ8TjZVOd1l75IwzMMMXtvl7GXkrbfQ+DzHiFQYU=;
        b=OAwMQRp2sP1FQIlsYEq26lrO98Cjos/nl0yoixEH+YtgJCuKmaDdNeHURATfRHhcej
         EY71QJh3Gz3cCL0eIH4DpW4Wa3fjepStoh1GDdmhG5RMw7fRCr8UfyDNfUz2zNtT5A4x
         FU5kZGNbcKZgHq8dE2eoinLj+d7YopIvIEm2UFTKeoaezHV7T7RjDWuE2QNjne3b3hya
         LAM+Q2v+Pw4Vb81JTtFNKkKzuAXaFVPuTLcyCj2H6+5me+4jsMknQvDBnu44pjei0q77
         xA+BoaZ7OAqAhotQV2we6PIhlX56tsMvD/rnSHIw+udnsBdQD9xy1cYi9htUGeOQwhpx
         SAvQ==
X-Gm-Message-State: AOAM533YgSFZzKL0z7y57/mMEJUT/f1FEVSlwy4Dcf05acWWdXoV/wZD
        FXMSpNfKBlcTi0Qsw+CPOyBkKg==
X-Google-Smtp-Source: ABdhPJy9yeGEAv39yBSx3Sa8U7lCyrtZAHxLX4W3Or999FIlZcvdqo5vIB0FWcdQCyuCMy+Br8o/Dg==
X-Received: by 2002:a05:600c:228f:b0:38e:74f7:a0fb with SMTP id 15-20020a05600c228f00b0038e74f7a0fbmr8334112wmf.39.1649262876338;
        Wed, 06 Apr 2022 09:34:36 -0700 (PDT)
Received: from google.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id bg20-20020a05600c3c9400b0037fa5c422c8sm5839444wmb.48.2022.04.06.09.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 09:34:36 -0700 (PDT)
Date:   Wed, 6 Apr 2022 16:34:34 +0000
From:   Sebastian Ene <sebastianene@google.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>, qperret@google.com,
        maz@kernel.org, linux-watchdog@vger.kernel.org, will@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add qemu,vm-watchdog
 compatible
Message-ID: <Yk3BGt2e+/1q10be@google.com>
References: <20220405141954.1489782-1-sebastianene@google.com>
 <20220405141954.1489782-2-sebastianene@google.com>
 <1649247924.294947.2048303.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649247924.294947.2048303.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Apr 06, 2022 at 07:25:24AM -0500, Rob Herring wrote:
> On Tue, 05 Apr 2022 14:19:54 +0000, Sebastian Ene wrote:
> > This watchdog can be used to detect stalls on vCPUs.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  .../devicetree/bindings/watchdog/vm-wdt.yaml  | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/vm-wdt.yaml
> > 

Hello Rob,

> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/vm-wdt.yaml: properties:timeout-sec: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/watchdog/vm-wdt.yaml: ignoring, error in schema: properties: timeout-sec
> Documentation/devicetree/bindings/watchdog/vm-wdt.example.dtb:0:0: /example-0/watchdog: failed to match any schema with compatible: ['qemu,vm-watchdog']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
> 

I will fix them, thanks for letting me know.

> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

Cheers,
Sebastian
