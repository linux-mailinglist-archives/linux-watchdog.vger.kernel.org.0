Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767C630382A
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Jan 2021 09:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731899AbhAZIix (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Jan 2021 03:38:53 -0500
Received: from gloria.sntech.de ([185.11.138.130]:36088 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390306AbhAZIir (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Jan 2021 03:38:47 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l4JrB-0000Yx-Vl; Tue, 26 Jan 2021 09:37:50 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-binding: watchdog: add more Rockchip compatibles to snps,dw-wdt.yaml
Date:   Tue, 26 Jan 2021 09:37:49 +0100
Message-ID: <2221632.MzOyzyC30C@diego>
In-Reply-To: <d6814912-ebbe-642d-161f-a005f40634d6@roeck-us.net>
References: <20201218120534.13788-1-jbx6244@gmail.com> <11680602.O9o76ZdvQC@phil> <d6814912-ebbe-642d-161f-a005f40634d6@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

Am Dienstag, 26. Januar 2021, 05:55:59 CET schrieb Guenter Roeck:
> On 1/25/21 3:40 PM, Heiko Stuebner wrote:
> > Am Samstag, 23. Januar 2021, 18:34:01 CET schrieb Guenter Roeck:
> >> On Fri, Dec 18, 2020 at 01:05:27PM +0100, Johan Jonker wrote:
> >>> The watchdog compatible strings are suppose to be SoC orientated.
> >>> In the more recently added Rockchip SoC dtsi files only
> >>> the fallback string "snps,dw-wdt" is used, so add the following
> >>> compatible strings:
> >>>
> >>> "rockchip,px30-wdt", "snps,dw-wdt"
> >>> "rockchip,rk3228-wdt", "snps,dw-wdt"
> >>> "rockchip,rk3308-wdt", "snps,dw-wdt"
> >>> "rockchip,rk3328-wdt", "snps,dw-wdt"
> >>> "rockchip,rk3399-wdt", "snps,dw-wdt"
> >>> "rockchip,rv1108-wdt", "snps,dw-wdt"
> >>>
> >>> make ARCH=arm dtbs_check
> >>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> >>>
> >>> make ARCH=arm64 dtbs_check
> >>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> >>>
> >>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> >>> Acked-by: Rob Herring <robh@kernel.org>
> >>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >>
> >> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > just to clarify, do you expect me to pick up the dt-binding patch
> > with the devicetree patches or do you want to take this individual
> > patch through the watchdog tree instead?
> > 
> 
> You'd have to ask Wim since he takes care of actually sending pull requests.
> But didn't you say earlier that you wanted to apply the rest of the series
> after this one is applied through the watchdog tree ?

Yep that was my intent, though somehow I mistook you as also being
a watchdog maintainer, hence the confusion.

So I'll wait for Wim to apply this patch and then I'll take the rest of
the series.

Thanks
Heiko


> >>> ---
> >>>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> >>> index f7ee9229c..b58596b18 100644
> >>> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> >>> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> >>> @@ -18,10 +18,16 @@ properties:
> >>>        - const: snps,dw-wdt
> >>>        - items:
> >>>            - enum:
> >>> +              - rockchip,px30-wdt
> >>>                - rockchip,rk3066-wdt
> >>>                - rockchip,rk3188-wdt
> >>> +              - rockchip,rk3228-wdt
> >>>                - rockchip,rk3288-wdt
> >>> +              - rockchip,rk3308-wdt
> >>> +              - rockchip,rk3328-wdt
> >>>                - rockchip,rk3368-wdt
> >>> +              - rockchip,rk3399-wdt
> >>> +              - rockchip,rv1108-wdt
> >>>            - const: snps,dw-wdt
> >>>  
> >>>    reg:
> >>
> > 
> > 
> > 
> > 
> 
> 




