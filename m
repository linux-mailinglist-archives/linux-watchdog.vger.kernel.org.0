Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFA765192E2
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 May 2022 02:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244724AbiEDAlU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 May 2022 20:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244720AbiEDAlT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 May 2022 20:41:19 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D37E38BC6;
        Tue,  3 May 2022 17:37:46 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-d39f741ba0so18834822fac.13;
        Tue, 03 May 2022 17:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5KRDlkFXP2wKyJ4meETvXlR/mwbS6ATze02B5zh4M/I=;
        b=hVS0IObbfK5iuHCRUd75CpLjUKQCmlHDdsC+hMcdDE0wnKST9TZ4m4le204i65fZz6
         ID1jZaEXD01bDsrvvnpptxYISBuZC2U5C9ieW1ElrswpmjUEDjmxcb82sZmjIeb9sBBL
         glOx1z0D0kDaWSG/FgL23yV5fwzE++DU64Z4jBRaDqkQhK7zlKsDjOWUgaHAm5Vu9GPQ
         FhG/9WwOk0CbxNHT9/RQi7JU0oHuL0rYIAt9xpxCCnVgpxzI/h22Z9pJhY+cBU1pSfgd
         ofCLFhTsUE7gxAbiO+3kxnY97snGD3314Ib1iiBOVqmuiOk3IVPSNfNiaSoRht5cS8oW
         nPtg==
X-Gm-Message-State: AOAM530bio/ftB+yyvB6uu/LQLAd5VH0etakho70xKP7i16Cg16FPn+l
        BID1vlpj5MoCYY6q76nckg==
X-Google-Smtp-Source: ABdhPJwpbBvVAluIMtMpusacL7lEcNFSGDnzv8haZzTXw2jd+ynaLdOcMnBngErwPMPRXOJgyYqV5g==
X-Received: by 2002:a05:6870:8996:b0:e2:976c:7732 with SMTP id f22-20020a056870899600b000e2976c7732mr2827995oaq.231.1651624665223;
        Tue, 03 May 2022 17:37:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 13-20020a9d048d000000b006060322124dsm4594491otm.29.2022.05.03.17.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 17:37:44 -0700 (PDT)
Received: (nullmailer pid 325837 invoked by uid 1000);
        Wed, 04 May 2022 00:37:43 -0000
Date:   Tue, 3 May 2022 19:37:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Primoz Fiser <primoz.fiser@norik.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrej Picej <andrej.picej@norik.com>, upstream@phytec.de
Subject: Re: [PATCH 1/3] dt-bindings: mfd: da9063: watchdog: add suspend
 disable option
Message-ID: <YnHK1xRduqhF2+vh@robh.at.kernel.org>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
 <YnBFg4exZKkqkxDo@robh.at.kernel.org>
 <bdedde60-aba8-5f7f-3a4a-b442e80fbb17@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdedde60-aba8-5f7f-3a4a-b442e80fbb17@norik.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, May 03, 2022 at 08:53:42AM +0200, Primoz Fiser wrote:
> Hi Rob,
> 

Please don't top post. Trim any irrelevant parts and reply below the 
original quoted text.

> > > Name the property based on the h/w quirk rather than what to do in
> > > response. Something like 'dlg,hw-suspend-broken'
> 
> Shouldn't we match da9062's property?

Ah, yes. I failed to grasp that from the 'based on commit...' in the 
commit msg.


> 
> As this commit is based on c514430c51ee8 ("dt-bindings: watchdog: da9062:
> add suspend disable option") which uses "dlg,use-sw-pm" as property to
> implement the same functionality.

The 'which uses "dlg,use-sw-pm" as property to implement the same 
functionality' part would be useful in the commit msg. With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Sure I can spin up v2 with your proposal but I think that would create
> unnecessary ambiguity and confusion?
> 
> For example, phyCORE board uses da9062 PMIC while phyFLEX uses da9063 as
> PMIC. Boards are from the same SoM vendor. So one board would have to use
> "dlg,use-sw-pm" and the other one "dlg,hw-suspend-broken" property to
> achieve the same thing?
> 
> 
> On 2. 05. 22 22:56, Rob Herring wrote:
> > On Fri, Apr 22, 2022 at 09:27:11AM +0200, Primoz Fiser wrote:
> > > Document the watchdog disable option which can be used if the hardware
> > > automatic suspend option is broken.
> > > 
> > > Based on commit c514430c51ee8 ("dt-bindings: watchdog: da9062: add
> > > suspend disable option").
> > > 
> > > Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> > > ---
> > >   Documentation/devicetree/bindings/mfd/da9063.txt | 9 ++++++---
> > >   1 file changed, 6 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
> > > index 91b79a21d403..aa8b800cc4ad 100644
> > > --- a/Documentation/devicetree/bindings/mfd/da9063.txt
> > > +++ b/Documentation/devicetree/bindings/mfd/da9063.txt
> > > @@ -64,10 +64,13 @@ Sub-nodes:
> > >       and KEY_SLEEP.
> > >   - watchdog : This node defines settings for the Watchdog timer associated
> > > -  with the DA9063 and DA9063L. There are currently no entries in this
> > > -  binding, however compatible = "dlg,da9063-watchdog" should be added
> > > -  if a node is created.
> > > +  with the DA9063 and DA9063L. The node should contain the compatible property
> > > +  with the value "dlg,da9063-watchdog".
> > > +  Optional watchdog properties:
> > > +  - dlg,use-sw-pm: Add this property to disable the watchdog during suspend.
> > 
> > Name the property based on the h/w quirk rather than what to do in
> > response. Something like 'dlg,hw-suspend-broken'
> > 
> > > +  Only use this option if you can't use the watchdog automatic suspend
> > > +  function during a suspend (see register CONTROL_B).
> > >   Example:
> > > -- 
> > > 2.25.1
> > > 
> > > 
