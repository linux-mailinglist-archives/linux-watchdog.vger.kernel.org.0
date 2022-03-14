Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF754D8AEE
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Mar 2022 18:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbiCNRlI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Mar 2022 13:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235429AbiCNRlH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Mar 2022 13:41:07 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4909F11C0C;
        Mon, 14 Mar 2022 10:39:57 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE4C8D6E;
        Mon, 14 Mar 2022 10:39:56 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A2BB3F66F;
        Mon, 14 Mar 2022 10:39:54 -0700 (PDT)
Date:   Mon, 14 Mar 2022 17:39:16 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mesih Kilinc <mesihkilinc@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jesse Taube <mr.bossman075@gmail.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        George Hilliard <thirtythreeforty@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 01/14] dt-bindings: watchdog: sunxi: fix F1C100s
 compatible
Message-ID: <20220314173839.2a7b593a@slackpad.lan>
In-Reply-To: <661806b7-d63f-a7cf-9192-f67c4cd79f29@sholland.org>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
        <20220307143421.1106209-2-andre.przywara@arm.com>
        <661806b7-d63f-a7cf-9192-f67c4cd79f29@sholland.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 9 Mar 2022 18:46:46 -0600
Samuel Holland <samuel@sholland.org> wrote:

> Hi Andre,
> 
> On 3/7/22 8:34 AM, Andre Przywara wrote:
> > The F1C100 series actually features a newer generation watchdog IP, so
> > the compatible string was wrong.  
> 
> The F1C100s watchdog seems to be unique in that it uses LOSC/osc32k as its only
> clock source instead of HOSC/osc24M. The current binding requires that the first
> clock is "hosc", so it seems that the binding needs to be relaxed to allow for
> this case.
> 
> As long as there's only one clock source available, we don't really care where
> it comes from. They are both divided to be approximately 32 kHz. So I don't
> think this difference prevents using A31 as a fallback compatible.

Right, these were roughly my findings as well, but I should have
written them down, at least in the commit message.

So shall the binding be explicit:
1) Most SoCs required exactly one clock, the 24 MHz HOSC.
2) The F1C100s requires exactly one clock, the 32KHz LOSC.
3) R329/D1 require two clocks with clock-names?

Or do you want to collapse 1) and 2) into one relaxed case? Still not
entirely sure what "LOSC / 32 KHz" means for the F1C100 (32768 or 32000
Hz), or where it really comes from, but it does not seem to matter.

FreeBSD, Xen and U-Boot don't care about clocks at all, and Linux
always uses the first clock and just enables it, so we should be good
either way.

> 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> > index 43afa24513b9..d90655418d0e 100644
> > --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> > @@ -29,7 +29,7 @@ properties:
> >            - const: allwinner,sun6i-a31-wdt
> >        - items:
> >            - const: allwinner,suniv-f1c100s-wdt
> > -          - const: allwinner,sun4i-a10-wdt
> > +          - const: allwinner,sun6i-a31-wdt  
> 
> This can be combined with the enum of other compatibles that fall back to
> allwinner,sun6i-a31-wdt (earlier in the file).

Oh, right, I missed that.

Cheers,
Andre

> 
> Regards,
> Samuel
> 
> >        - const: allwinner,sun20i-d1-wdt
> >        - items:
> >            - const: allwinner,sun20i-d1-wdt-reset
> >   
> 
> 

