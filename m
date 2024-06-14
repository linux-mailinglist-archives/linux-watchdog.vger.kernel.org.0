Return-Path: <linux-watchdog+bounces-1123-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5184908548
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 09:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802EE281DD1
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 07:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9864614B094;
	Fri, 14 Jun 2024 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIHS/sS3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0DD12EBD6;
	Fri, 14 Jun 2024 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718351410; cv=none; b=W5IGDvb7+fEUHXqVgTqaG5aXV9JwmM4IfsxrwtkIH7jnEBVJbapa3BCa9wfXuuBKYT0HPQ97rCrTDXOr24xiJziGJc+Q02JNmWGY8b3Ix7DQPqx+R8rCVKIZlBZG+DR47hAsvrhy1aIblEQY8INXgq5Rc26ZXVLur4zgcnvNuXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718351410; c=relaxed/simple;
	bh=FD0C/g5YjTkfMYb+lA41KnnlFh7KEnID6YaI58OpEAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0wBRKTQcO3mfl/UXuxE3ED/vQEOqn0nK/7vejCYh7+46uys9kzuyS7c2AUJSl/JNOASh7m8kiECa0mFKZl9WEXD6+2ugB0GHhisXSP6by1vHESb0VxMT1eIQD2D8sVRdygqkQG3EeSNA7RuW1X4D6lCMSPpfyCUeQ6Ty6Pzf4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIHS/sS3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E38AC2BD10;
	Fri, 14 Jun 2024 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718351409;
	bh=FD0C/g5YjTkfMYb+lA41KnnlFh7KEnID6YaI58OpEAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIHS/sS3YQt3Z+1lmWdO2ecFMhwIov56O4T3vx7/IcvtL3VKj6gbBsKLzqZFRZ2Gh
	 t5cfbuPLCifP8JQ1MQNx1BD0GaWhuEuJCtGeqfy0VVy6Dy8DbGWfWhPbHELujUZn1f
	 NRfWySDkM/61x0A3xDXpCZBGbgftCTjH236COPqaJMAwf0zvAiBTqXAt+CBLtxmZxN
	 Y1dbQ79A9pVDjc/QVnRdtvw5zg4oKpsEjGsxjRa758n4v8N9QHrk03LbfXo5SzomGu
	 FtOkxou4GDkc6aHgqBU8tdsJWf2iFPH0rzZlS2Zfyin4FZlwKiZadUOnMIhzYksw38
	 gF2Ewg2nhwrVA==
Date: Fri, 14 Jun 2024 08:50:04 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 09/10] mfd: bd96801: Add ERRB IRQ
Message-ID: <20240614075004.GB2561462@google.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
 <332a2d2429e2ba3c96afd28c1ccc18efc38e1fd3.1717486682.git.mazziesaccount@gmail.com>
 <20240613163249.GN2561462@google.com>
 <21a468c2-7d8f-459a-a5a9-53d8694c3f38@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21a468c2-7d8f-459a-a5a9-53d8694c3f38@gmail.com>

On Fri, 14 Jun 2024, Matti Vaittinen wrote:

> On 6/13/24 19:32, Lee Jones wrote:
> > On Tue, 04 Jun 2024, Matti Vaittinen wrote:
> > 
> > > The ROHM BD96801 "scalable PMIC" provides two physical IRQs. The ERRB
> > > handling can in many cases be omitted because it is used to inform fatal
> > > IRQs, which usually kill the power from the SOC.
> > > 
> > > There may however be use-cases where the SOC has a 'back-up' emergency
> > > power source which allows some very short time of operation to try to
> > > gracefully shut down sensitive hardware. Furthermore, it is possible the
> > > processor controlling the PMIC is not powered by the PMIC. In such cases
> > > handling the ERRB IRQs may be beneficial.
> > > 
> > > Add support for ERRB IRQs.
> > > 
> > > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > > ---
> > > Revision history:
> > > v2 =>:
> > > 	- No changes
> > > v1 => v2:
> > > 	- New patch
> > > ---
> > >   drivers/mfd/rohm-bd96801.c | 291 ++++++++++++++++++++++++++++++++-----
> > >   1 file changed, 253 insertions(+), 38 deletions(-)
> > > 
> > > diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
> > > index 1c2a9591be7b..b7f073318873 100644
> > > --- a/drivers/mfd/rohm-bd96801.c
> > > +++ b/drivers/mfd/rohm-bd96801.c
> > > @@ -5,13 +5,9 @@
> > >    * ROHM BD96801 PMIC driver
> > >    *
> > >    * This version of the "BD86801 scalable PMIC"'s driver supports only very
> > > - * basic set of the PMIC features. Most notably, there is no support for
> > > - * the ERRB interrupt and the configurations which should be done when the
> > > - * PMIC is in STBY mode.
> > > - *
> > > - * Supporting the ERRB interrupt would require dropping the regmap-IRQ
> > > - * usage or working around (or accepting a presense of) a naming conflict
> > > - * in debugFS IRQs.
> > 
> > Why bother adding all that blurb in the first place?
> 
> Because, I assume there are users who would like to have the ERRB in use.
> The main purpose of this comment is that any such users could
> 	a) see this version does not support ERRB.
> 	b) can find the original RFC with ERRB supportn and a workaround.
> 	c) know why this version does not work with ERRB and thus fix this
> 
> It seems this ERRB support may be missing from upstream for a while, hence I
> think having this note is worthy until (if) this ERRB patch lands in
> upstream.

What I mean is - you're adding all of these extra lines in patch 3 and
removing them in patch 9.

> > > + * basic set of the PMIC features.
> > > + * Most notably, there is no support for the configurations which should
> > > + * be done when the PMIC is in STBY mode.
> > >    *
> > >    * Being able to reliably do the configurations like changing the
> > >    * regulator safety limits (like limits for the over/under -voltages, over
> > > @@ -23,16 +19,14 @@
> > >    * be the need to configure these safety limits. Hence it's not simple to
> > >    * come up with a generic solution.
> > >    *
> > > - * Users who require the ERRB handling and STBY state configurations can
> > > - * have a look at the original RFC:
> > > + * Users who require the STBY state configurations can  have a look at the
> > > + * original RFC:
> > >    * https://lore.kernel.org/all/cover.1712920132.git.mazziesaccount@gmail.com/
> > > - * which implements a workaround to debugFS naming conflict and some of
> > > - * the safety limit configurations - but leaves the state change handling
> > > - * and synchronization to be implemented.
> > > + * which implements some of the safety limit configurations - but leaves the
> > > + * state change handling and synchronization to be implemented.
> > >    *
> > >    * It would be great to hear (and receive a patch!) if you implement the
> > > - * STBY configuration support or a proper fix to the debugFS naming
> > > - * conflict in your downstream driver ;)
> > > + * STBY configuration support or a proper fix in your downstream driver ;)
> > >    */
> 
> ...
> 
> > >   static int bd96801_i2c_probe(struct i2c_client *i2c)
> > >   {
> > > -	struct regmap_irq_chip_data *intb_irq_data;
> > > +	int i, ret, intb_irq, errb_irq, num_regu_irqs, num_intb, num_errb = 0;
> > > +	int wdg_irq_no;
> > > +	struct regmap_irq_chip_data *intb_irq_data, *errb_irq_data;
> > > +	struct irq_domain *intb_domain, *errb_domain;
> > > +	struct resource wdg_irq;
> > >   	const struct fwnode_handle *fwnode;
> > > -	struct irq_domain *intb_domain;
> > > +	struct resource *regulator_res;
> > >   	struct regmap *regmap;
> > > -	int ret, intb_irq;
> > >   	fwnode = dev_fwnode(&i2c->dev);
> > >   	if (!fwnode)
> > > @@ -212,10 +364,28 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
> > >   	if (intb_irq < 0)
> > >   		return dev_err_probe(&i2c->dev, intb_irq, "INTB IRQ not configured\n");
> > > +	num_intb =  ARRAY_SIZE(regulator_intb_irqs);
> > > +
> > > +	/* ERRB may be omitted if processor is powered by the PMIC */
> > > +	errb_irq = fwnode_irq_get_byname(fwnode, "errb");
> > > +	if (errb_irq < 0)
> > > +		errb_irq = 0;
> > > +
> > > +	if (errb_irq)
> > > +		num_errb = ARRAY_SIZE(regulator_errb_irqs);
> > > +
> > > +	num_regu_irqs = num_intb + num_errb;
> > > +
> > > +	regulator_res = kcalloc(num_regu_irqs, sizeof(*regulator_res), GFP_KERNEL);
> > 
> > Why not devm_* and omit the kfree()?
> 
> I used kcalloc() because this memory is only temporarily needed. It is not
> needed after devm_mfd_add_devices() returns.
> 
> Sure the devm_* would simplify the error paths... Thanks!
> 
> > 
> > > +	if (!regulator_res)
> > > +		return -ENOMEM;
> > > +
> > >   	regmap = devm_regmap_init_i2c(i2c, &bd96801_regmap_config);
> > > -	if (IS_ERR(regmap))
> > > -		return dev_err_probe(&i2c->dev, PTR_ERR(regmap),
> > > +	if (IS_ERR(regmap)) {
> > > +		ret = dev_err_probe(&i2c->dev, PTR_ERR(regmap),
> > >   				    "Regmap initialization failed\n");
> > > +		goto free_out;
> > > +	}
> > >   	ret = regmap_write(regmap, BD96801_LOCK_REG, BD96801_UNLOCK);
> > >   	if (ret)
> > > @@ -224,18 +394,63 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
> > >   	ret = devm_regmap_add_irq_chip(&i2c->dev, regmap, intb_irq,
> > >   				       IRQF_ONESHOT, 0, &bd96801_irq_chip_intb,
> > >   				       &intb_irq_data);
> > > -	if (ret)
> > > -		return dev_err_probe(&i2c->dev, ret, "Failed to add INTB IRQ chip\n");
> > > +	if (ret) {
> > > +		dev_err_probe(&i2c->dev, ret, "Failed to add INTB irq_chip\n");
> > > +		goto free_out;
> > > +	}
> > >   	intb_domain = regmap_irq_get_domain(intb_irq_data);
> > > -	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
> > > -				   bd96801_mfd_cells,
> > > -				   ARRAY_SIZE(bd96801_mfd_cells), NULL, 0,
> > > -				   intb_domain);
> > > -
> > > +	/*
> > > +	 * MFD core code is built to handle only one IRQ domain. BD96801
> > > +	 * has two domains so we do IRQ mapping here and provide the
> > > +	 * already mapped IRQ numbers to sub-devices.
> > > +	 */
> > > +	for (i = 0; i < num_intb; i++) {
> > > +		struct resource *res = &regulator_res[i];
> > > +
> > > +		*res = regulator_intb_irqs[i];
> > > +		res->start = res->end = irq_create_mapping(intb_domain,
> > > +							    res->start);
> > > +	}
> > > +
> > > +	wdg_irq_no = irq_create_mapping(intb_domain, BD96801_WDT_ERR_STAT);
> > > +	wdg_irq = DEFINE_RES_IRQ_NAMED(wdg_irq_no, "bd96801-wdg");
> > > +	bd96801_mfd_cells[WDG_CELL].resources = &wdg_irq;
> > > +	bd96801_mfd_cells[WDG_CELL].num_resources = 1;
> > > +
> > > +	if (num_errb) {
> > 
> > 	if (!num_errb)
> > 		goto skip_errb;
> 
> Ok, can do.
> 
> > 
> > > +		ret = devm_regmap_add_irq_chip(&i2c->dev, regmap, errb_irq,
> > > +					       IRQF_ONESHOT, 0,
> > > +					       &bd96801_irq_chip_errb,
> > > +					       &errb_irq_data);
> > > +		if (ret) {
> > > +			dev_err_probe(&i2c->dev, ret,
> > > +				      "Failed to add ERRB (%d) irq_chip\n",
> > > +				      errb_irq);
> > > +			goto free_out;
> > > +		}
> > > +		errb_domain = regmap_irq_get_domain(errb_irq_data);
> > > +
> > > +		for (i = 0; i < num_errb; i++) {
> > > +			struct resource *res = &regulator_res[num_intb + i];
> > > +
> > > +			*res = regulator_errb_irqs[i];
> > > +			res->start = res->end = irq_create_mapping(errb_domain,
> > > +								   res->start);
> > > +		}
> > > +	}
> > 
> > skip_errb:
> 
> ...
> 
> Thanks for comments Lee. Reworking this will have to wait for the irqdomain
> name suffix, which I will continue after Hervé has done his part of the
> irqdomain changes. I will omit this patch from the next re-spin of the
> series.

I'm in no rush. :)

-- 
Lee Jones [李琼斯]

