Return-Path: <linux-watchdog+bounces-3178-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2904A7574B
	for <lists+linux-watchdog@lfdr.de>; Sat, 29 Mar 2025 18:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37A9E3AE21F
	for <lists+linux-watchdog@lfdr.de>; Sat, 29 Mar 2025 17:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B83149C55;
	Sat, 29 Mar 2025 17:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpxNYRkt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446E57FBD6;
	Sat, 29 Mar 2025 17:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743268337; cv=none; b=GK0ZLQF+dUHs6QnaiFJ7O5HC7/JhqybUxJVfsJ2f2SAXvJCLRthbUNH7GyQ8Lyfzy7k9hvl47BHJU/gtiDRZ6GqUUTYFHLRjhovCNbImPt7gpJ2InM19OGxUUEeA1D1L57aeu2Zh22uYAOV0xCzhSneQM2a04M2BjK/U6qelx38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743268337; c=relaxed/simple;
	bh=kdCx5doiFqQ/0qrNY7WENztc254Hfa+ysJOTF5wUoNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EL08HsOk+fScr7ewtr9PXEhPmFvG3zJ7kFpvWB2lMGSckXOPog8RQn/nOvbP7X7EduJM/g9locXqPY+WTuMnAkZ+4bok7JOwtFAbkwWQ1R3o0O4dCX7FKbdTkRiVEi1eYIwd8Ixui/QUWlGjIz1LhYdVXyYE+OGwj1Of02YDsL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpxNYRkt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A467C4CEE2;
	Sat, 29 Mar 2025 17:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743268336;
	bh=kdCx5doiFqQ/0qrNY7WENztc254Hfa+ysJOTF5wUoNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpxNYRkt0fQ7i1BpVxLvydM9MwjHvbz9qxFkTLHg7xAbz4p6uVUC+XVSh4MBVHPnI
	 EnFTF51BrW/8EA5H126vHeqwTCKbUB/VlUVTylcrtJ9zcoR9JKV1unqcHP4BACivp2
	 zFDMtwDNs/y6ErGymv96mEkEz6sbqWUPYWFFmEJaXXNRT18dNkkNtHdlpdMOUzJVsE
	 gkQvx6NKUIsNgFLXcC21/XTQgwuBNB8DSxyMqn6Dm630kQsyJCSsukLH4yl3qiX89G
	 yqh3it+ObohcbGxXiyefjHH5vrDG4mj1SNyEyWFjKaAEmlmgL+Q5pts2CMV3bBtYco
	 lmySLeq3OOIAg==
Date: Sat, 29 Mar 2025 12:12:15 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, linux@roeck-us.net,
	Thomas Fossati <thomas.fossati@linaro.org>,
	linux-watchdog@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	wim@linux-watchdog.org, S32@nxp.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
Message-ID: <20250329171215.GA2298924-robh@kernel.org>
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
 <174321222207.2172829.15350189767926637719.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174321222207.2172829.15350189767926637719.robh@kernel.org>

On Fri, Mar 28, 2025 at 08:37:03PM -0500, Rob Herring (Arm) wrote:
> 
> On Fri, 28 Mar 2025 16:15:13 +0100, Daniel Lezcano wrote:
> > Describe the Software Watchdog Timer available on the S32G platforms.
> > 
> > Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > Cc: Thomas Fossati <thomas.fossati@linaro.org>
> > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> > ---
> >  .../bindings/watchdog/nxp,s32g-wdt.yaml       | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.example.dts:18.29-23.11: Warning (unit_address_format): /example-0/watchdog@0x40100000: unit name should not have leading "0x"
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.example.dtb: watchdog@0x40100000: 'timeout-sec' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/watchdog/nxp,s32g-wdt.yaml#

You need unevaluatedProperties instead of additionalProperties.

Rob

