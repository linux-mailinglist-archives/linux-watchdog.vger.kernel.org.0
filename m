Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362BA29F0E0
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 17:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgJ2QNP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 12:13:15 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46617 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgJ2QNO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 12:13:14 -0400
Received: by mail-ed1-f67.google.com with SMTP id t11so3560040edj.13;
        Thu, 29 Oct 2020 09:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0x91uo33SqahreEp/vgik9wVXC+fxrX3zZ93nXMNWTo=;
        b=fGGpMP7ZgOZkfsFXorx9qAmbH2eQ2sHd0QAHb6ppv8sIdsgmKMvKou14E9yLfUfIdb
         rfvGSBU4otsPqlPFuinP+zAwPmGesMm8JW5+l/J97K+vlJNfUGN1ESDm3ajB9KU3ud3p
         ifPxcCm/utp06ec1Pc/mdzRmb3vz3DYb4yg7h+L6uNUq/p5apcn9NnnzOqt/+oaugtvD
         TrJ76SyL+4azRWubGmWQ0Bk6mwWq1dVgCEfEVc5x9bAaE2WpZvXB5kcTI+4GqVxuRQVY
         qQA0Qybq/Jqgps68r7fExTegiOrxoYIhtTMF9I5UWzQyYalzNhSGTn8Tx3Zpje6n6Q0d
         XvRg==
X-Gm-Message-State: AOAM533vJIigDIeqL78fTEz8XF0xIwEGJqiaL5kY+Hr3AcY/2PL2LwTY
        KnSpgys56rwDZIFshpSILjo=
X-Google-Smtp-Source: ABdhPJzTCkYDJ61zzUWY9XYIIhmRRVLqhB4Jr35RnAsc3sY5Vra5anYkbwcdHcZ7qaK91xGLDx4Mkg==
X-Received: by 2002:a50:da8d:: with SMTP id q13mr4912922edj.370.1603987993239;
        Thu, 29 Oct 2020 09:13:13 -0700 (PDT)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id ce13sm1836318edb.32.2020.10.29.09.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 09:13:11 -0700 (PDT)
Date:   Thu, 29 Oct 2020 17:13:10 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Anson Huang <Anson.Huang@nxp.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: fsl-imx: document i.MX
 compatibles
Message-ID: <20201029161310.GA29346@kozik-lap>
References: <20200926162302.32525-1-krzk@kernel.org>
 <20201029143508.GO28755@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201029143508.GO28755@dragon>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Oct 29, 2020 at 10:35:09PM +0800, Shawn Guo wrote:
> On Sat, Sep 26, 2020 at 06:23:00PM +0200, Krzysztof Kozlowski wrote:
> > Document all ARMv5, ARMv6 and ARMv7 i.MX compatibles used in DTSes (even
> > though driver binds only to fsl,imx21-wdt) to fix dtbs_check warnings
> > like:
> > 
> >   arch/arm/boot/dts/imx53-qsb.dt.yaml: gpio@53fe0000: compatible:
> >     ['fsl,imx53-gpio', 'fsl,imx35-gpio'] is not valid under any of the given schemas
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > index 991b4e33486e..a06e70f44fd0 100644
> > --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > @@ -18,10 +18,24 @@ properties:
> >        - const: fsl,imx21-wdt
> >        - items:
> >            - enum:
> > +              - fsl,imx25-wdt
> > +              - fsl,imx27-wdt
> > +              - fsl,imx31-wdt
> > +              - fsl,imx35-wdt
> > +              - fsl,imx50-wdt
> > +              - fsl,imx51-wdt
> > +              - fsl,imx53-wdt
> > +              - fsl,imx6q-wdt
> > +              - fsl,imx6sl-wdt
> > +              - fsl,imx6sll-wdt
> > +              - fsl,imx6sx-wdt
> > +              - fsl,imx6ul-wdt
> > +              - fsl,imx7d-wdt
> >                - fsl,imx8mm-wdt
> >                - fsl,imx8mn-wdt
> >                - fsl,imx8mp-wdt
> >                - fsl,imx8mq-wdt
> 
> Could you add the following two as well?
> 
>     - fsl,ls1012a-wdt
>     - fsl,ls1043a-wdt

I focused in these patches on i.MX but I can fix the Layerscape as well.

Best regards,
Krzysztof

