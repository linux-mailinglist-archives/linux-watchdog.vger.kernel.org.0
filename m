Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB1F7C0329
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Oct 2023 20:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbjJJSKl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Oct 2023 14:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232051AbjJJSKk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Oct 2023 14:10:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267B494
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Oct 2023 11:10:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A984CC433C8;
        Tue, 10 Oct 2023 18:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696961437;
        bh=fuUv/hXFNtI8qkkHLgstDIXDcQVXAaXWBEh1chCBBDw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c4tlVOXn6Bc38D98V4HYYQ+VE0srU+yssoa3NJW6PXFBOK6SojwInAdcTmQQdu3zj
         blbj8pyp57g4WlCr9PfIzlCQYLOVFh0Nhho600+AkdgCVh/3kNGP6roh/wYO1jXYcl
         kuFobQ43LMJ60I5IqlT8NCBwH5RWsBVQLyLScniC/zg8UtHzwHcsls59o779A83LlT
         +AIQau0AgLUD1NGDPcHtI6SEOb9VMZCDxg8s1jbczpLvU4IOAB+gPyxgz1s8oMTN25
         tihYhFsjWbYfWWYMSq9oPFcJQ1EevCgKM9dui0ptcWbJw/to1oldR//Rhl5TaqvuPZ
         rKn+RY3LX+x8w==
Received: (nullmailer pid 1182797 invoked by uid 1000);
        Tue, 10 Oct 2023 18:10:35 -0000
Date:   Tue, 10 Oct 2023 13:10:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        wim@linux-watchdog.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.hauer@pengutronix.de,
        festevam@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        linux@roeck-us.net, shawnguo@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: fsl-imx7ulp-wdt: Add
 'fsl,ext-reset-output'
Message-ID: <169696143472.1182561.15105900331518622505.robh@kernel.org>
References: <20231010081909.2899101-1-ping.bai@nxp.com>
 <20231010081909.2899101-2-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010081909.2899101-2-ping.bai@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On Tue, 10 Oct 2023 16:19:08 +0800, Jacky Bai wrote:
> The wdog may generate wdog_any external reset if the int_en bit is
> configured, so add a property for this purpose in dt-binding doc.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

