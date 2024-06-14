Return-Path: <linux-watchdog+bounces-1125-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CB8908784
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 11:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D466B2852E0
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 09:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B591192B87;
	Fri, 14 Jun 2024 09:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1vCKPlT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E813BAC8;
	Fri, 14 Jun 2024 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357607; cv=none; b=ZayZTL7pzwehh1666p4AmS+iD4M+Um0rC6l9xFyqicyNLErVMQkQLu1xi+RtWAZwtbh70yZNFJKVx1pMrhWyiL0OOPoMz2ljV4jVT6JRUUg1kvsxNp4fJkvCCweeETlpuarJ/lmRqxDGJHX1WcIjmMcr51uNm7jvGtOiwin1Qlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357607; c=relaxed/simple;
	bh=oz5dCPGNYaLUB049MlZo5T8NjvnUrFW7EiDM8XybnpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9TbGZ/R/V966CaUVkRnIOBHduKDiZdkJFHkEmwpFkuX+emrwibvVWCwbwWy6+Jvd3EdlSFtvmKqSnJy+aVABS4oUHBspdJ6N96mWy1UqSeYVHyaJF6QEIF/yelMq/cRuOXQDe314nTYZxrFZ+crxDsPLwTOZv3QnOwiholw1BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1vCKPlT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9511DC2BD10;
	Fri, 14 Jun 2024 09:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718357606;
	bh=oz5dCPGNYaLUB049MlZo5T8NjvnUrFW7EiDM8XybnpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1vCKPlTictAs/u2emvfdVKILP14kIPakQWrc+wjNSycsVakMDyJqrBccq4brHzem
	 L9FV3NfbuhEn/Jy03MPw5cWst13n85Z4WmWgNBrV5dvACBlYCWix4Ch/FjS8i5AEjx
	 yyrhXSF8JtDqlUpVJkwkLh8fHMdmAacGWclLP6+CcJOTuGLkdSLAE9hpnLwDFwiFrn
	 edCVh5Spc46wy4XQZ/xbI6b5zFZXeR6+S75WESYpdkSErAF7o/j95f/5qKMfC8of6A
	 3rvrs/TlibGQ0qlMo/kjMgGgfwiuRE1408PAlD6XsKTlU0XNRIhcRLWDoRBBjiXlEG
	 /wzNXyFg1FO7Q==
Date: Fri, 14 Jun 2024 10:33:21 +0100
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
Message-ID: <20240614093321.GE3029315@google.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
 <332a2d2429e2ba3c96afd28c1ccc18efc38e1fd3.1717486682.git.mazziesaccount@gmail.com>
 <20240613163249.GN2561462@google.com>
 <21a468c2-7d8f-459a-a5a9-53d8694c3f38@gmail.com>
 <20240614075004.GB2561462@google.com>
 <b585d817-da4d-45b1-87b5-2cfdc8b8823b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b585d817-da4d-45b1-87b5-2cfdc8b8823b@gmail.com>

On Fri, 14 Jun 2024, Matti Vaittinen wrote:

> On 6/14/24 10:50, Lee Jones wrote:
> > On Fri, 14 Jun 2024, Matti Vaittinen wrote:
> > 
> > > On 6/13/24 19:32, Lee Jones wrote:
> > > > On Tue, 04 Jun 2024, Matti Vaittinen wrote:
> > > > 
> > > > > The ROHM BD96801 "scalable PMIC" provides two physical IRQs. The ERRB
> > > > > handling can in many cases be omitted because it is used to inform fatal
> > > > > IRQs, which usually kill the power from the SOC.
> > > > > 
> > > > > There may however be use-cases where the SOC has a 'back-up' emergency
> > > > > power source which allows some very short time of operation to try to
> > > > > gracefully shut down sensitive hardware. Furthermore, it is possible the
> > > > > processor controlling the PMIC is not powered by the PMIC. In such cases
> > > > > handling the ERRB IRQs may be beneficial.
> > > > > 
> > > > > Add support for ERRB IRQs.
> > > > > 
> > > > > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > > > > ---
> > > > > Revision history:
> > > > > v2 =>:
> > > > > 	- No changes
> > > > > v1 => v2:
> > > > > 	- New patch
> > > > > ---
> > > > >    drivers/mfd/rohm-bd96801.c | 291 ++++++++++++++++++++++++++++++++-----
> > > > >    1 file changed, 253 insertions(+), 38 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
> > > > > index 1c2a9591be7b..b7f073318873 100644
> > > > > --- a/drivers/mfd/rohm-bd96801.c
> > > > > +++ b/drivers/mfd/rohm-bd96801.c
> > > > > @@ -5,13 +5,9 @@
> > > > >     * ROHM BD96801 PMIC driver
> > > > >     *
> > > > >     * This version of the "BD86801 scalable PMIC"'s driver supports only very
> > > > > - * basic set of the PMIC features. Most notably, there is no support for
> > > > > - * the ERRB interrupt and the configurations which should be done when the
> > > > > - * PMIC is in STBY mode.
> > > > > - *
> > > > > - * Supporting the ERRB interrupt would require dropping the regmap-IRQ
> > > > > - * usage or working around (or accepting a presense of) a naming conflict
> > > > > - * in debugFS IRQs.
> > > > 
> > > > Why bother adding all that blurb in the first place?
> > > 
> > > Because, I assume there are users who would like to have the ERRB in use.
> > > The main purpose of this comment is that any such users could
> > > 	a) see this version does not support ERRB.
> > > 	b) can find the original RFC with ERRB supportn and a workaround.
> > > 	c) know why this version does not work with ERRB and thus fix this
> > > 
> > > It seems this ERRB support may be missing from upstream for a while, hence I
> > > think having this note is worthy until (if) this ERRB patch lands in
> > > upstream.
> > 
> > What I mean is - you're adding all of these extra lines in patch 3 and
> > removing them in patch 9.
> > 
> 
> True. This is because I had a feeling the irqdomain changes might not get
> merged that fast as it seemed like something that is not completely trivial.
> This comment is useful if patches 7-10 aren't merged together with 1-6 -
> which I now also hope is the case XD
> 
> > > > > + * basic set of the PMIC features.
> > > > > + * Most notably, there is no support for the configurations which should
> > > > > + * be done when the PMIC is in STBY mode.
> > > > >     *
> > > > >     * Being able to reliably do the configurations like changing the
> > > > >     * regulator safety limits (like limits for the over/under -voltages, over
> > > > > @@ -23,16 +19,14 @@
> > > > >     * be the need to configure these safety limits. Hence it's not simple to
> > > > >     * come up with a generic solution.
> > > > >     *
> > > > > - * Users who require the ERRB handling and STBY state configurations can
> > > > > - * have a look at the original RFC:
> > > > > + * Users who require the STBY state configurations can  have a look at the
> > > > > + * original RFC:
> > > > >     * https://lore.kernel.org/all/cover.1712920132.git.mazziesaccount@gmail.com/
> > > > > - * which implements a workaround to debugFS naming conflict and some of
> > > > > - * the safety limit configurations - but leaves the state change handling
> > > > > - * and synchronization to be implemented.
> > > > > + * which implements some of the safety limit configurations - but leaves the
> > > > > + * state change handling and synchronization to be implemented.
> > > > >     *
> > > > >     * It would be great to hear (and receive a patch!) if you implement the
> > > > > - * STBY configuration support or a proper fix to the debugFS naming
> > > > > - * conflict in your downstream driver ;)
> > > > > + * STBY configuration support or a proper fix in your downstream driver ;)
> > > > >     */
> > > 
> > > ...
> > > 
> > > Thanks for comments Lee. Reworking this will have to wait for the irqdomain
> > > name suffix, which I will continue after Hervé has done his part of the
> > > irqdomain changes. I will omit this patch from the next re-spin of the
> > > series.
> > 
> > I'm in no rush. :)
> 
> Well, glad to hear ;) I still usually try to avoid delaying sending the
> follow-up patches. I am under impression it is easier to review the new
> revision if the previous revision was not reviewed too long ago... ;)

I'm used to it.  Old reviews are cached locally.

> I feel it is polite to tell the reviewers there will be some delay when I
> know it.

I wouldn't lose any sleep over it. :)

-- 
Lee Jones [李琼斯]

