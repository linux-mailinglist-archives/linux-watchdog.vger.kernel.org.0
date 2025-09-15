Return-Path: <linux-watchdog+bounces-4249-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3FCB586D0
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Sep 2025 23:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D38F31B22423
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Sep 2025 21:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B311F30BB;
	Mon, 15 Sep 2025 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coWvyVeC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD210EACE;
	Mon, 15 Sep 2025 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757972063; cv=none; b=DEB2S+PdRv3lkZxpgnPEEiZJBsRICoMwwMkDOHiJUczPNc2rvxnM7OV/H7sTTh0O6cTy27M3i/WiO5QXkT9PsxBZmCm/mYL90GkJMSxG8ire7aLqXcQG4iq6uALfxvJ0zvGIorCvVkd+vkhsoCcGSr1AKQVGChEGAJYh0J6B3Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757972063; c=relaxed/simple;
	bh=EQ9er1liAcJ0+LgMZjQy4CDVJThm9UrjoRfFH7qfXIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ae3Tj+Eo/na54DxsNR6gwMNgd1rX+dPupywl2ahOkA/qn9N42KyKGAWYjMsg5mOmRNz0/56qMQcSZYC/tZFNds22FODDojs+ajleV3VCyJ8CTonoj64tCY3eXdUmlquJOdfqi27z/Aiec4rMA4E6s4t7T3zyKvQF58ionsDlCTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coWvyVeC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B327C4CEF1;
	Mon, 15 Sep 2025 21:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757972062;
	bh=EQ9er1liAcJ0+LgMZjQy4CDVJThm9UrjoRfFH7qfXIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coWvyVeCz1LjDVyYAu06PP1m/8FpKwRYQqc8+hGy/A+U9tNUwRQ4jN2a/JppPCaDF
	 iNBlXJN6If8azp/Oa3mMmC2Slbx20pHDJgNk8lHZhyBndkClSsI8H8NOOAuF4fVH6z
	 kH4HMrL4ceSFP/bhVgP66HW7evVSh2XXCpa88pD89GQVKabsQInk5339ALT+V3ImV5
	 hb2BvGTTl7Wh82KVNVJU5GNY6jpFM6SBV6xr7OLMl4oijIUP8pt1XEk5TiYfIRh7lK
	 MxcjWW08uOuMBPPVMvw7smbSgK69p0+nhjCpQX8y+QC7X20Ltplc5VWJNwp2lSNjSK
	 xOkdBBD7Us75A==
Date: Mon, 15 Sep 2025 16:34:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Andrew Davis <afd@ti.com>,
	linux-hwmon@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: mfd: tps6594: allow gpio-line-names
Message-ID: <175797205997.3572376.2459188333826155892.robh@kernel.org>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <20250912120745.2295115-3-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912120745.2295115-3-mwalle@kernel.org>


On Fri, 12 Sep 2025 14:07:40 +0200, Michael Walle wrote:
> Setting the signal names in the device tree was already possible, but
> it will lead to a warning. Allow the gpio-line-names property to fix
> that.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


