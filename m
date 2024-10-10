Return-Path: <linux-watchdog+bounces-2185-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D4D99915C
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 20:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4BF71C229A7
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 18:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CD81CF7B2;
	Thu, 10 Oct 2024 18:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xu5ZzRTf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF0E1CEEA6;
	Thu, 10 Oct 2024 18:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728585120; cv=none; b=kfex6eOtNymTe5jqPZdPvPJFZhKCxexCE0eDxvn4DdBLbORoQbJknlrvSGshzOmULxzbHS/5VuOzgf4Cw+cGL7W40NYPUIZgsMNVsekjyFsekRZ7bXepIsBR3p1q8TabFY36ivhcOwfMNanq6xVgvEnCDZyXE6tJsIBJOyZTx8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728585120; c=relaxed/simple;
	bh=SZXNydOJMWNXXLs/4/NNz4xsUZciFSY/wDDP/eBnJxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEOYYow6Z0K8Bql1MiHOwlHN63aM+96ku5vOWQc2gYQC4cmm+Wb9U/ihpxYPaPlzUdvruDKtXD14y1dyEu8S8ZEEbnPwN/VZbznT8m+eRQXNzW0Gow7neaBCSlsiFqQ5ieOXpDMT2Sjlj5mlt904WxgZaj8/7c44XFOi4ueMkTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xu5ZzRTf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5CBC4CEC5;
	Thu, 10 Oct 2024 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728585120;
	bh=SZXNydOJMWNXXLs/4/NNz4xsUZciFSY/wDDP/eBnJxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xu5ZzRTfzKp0YpHmKUlkPGvvlgNd/kW3Vg72eAStKxoag84d9i5dTklpDTUI4j1pJ
	 aWa7wflpCFNJZP7C/DWeA7cPr4I3ozvOfXDnUZV4DOLRPU4fTig7AVlstxsig4q6+B
	 bV0E7LZ44twkfH/1ByZ1zTHUKIwEm13j9wMpOMOlOKOIIpR0i06Z4A7jRDskZ5P2lF
	 qssIiuSo0mMuLdo6Gx7qpnDS7q/JKpUoxinBt9pOygY3eu0U76sDVISMPvNaE8h3Lh
	 dccGwW45ZrukxezFRD+v4S9WlQY5C7CW86lYcN3GO+aTd9T9+5QObBsqJnv+WU2qsj
	 bGzmtilEnBisA==
Date: Thu, 10 Oct 2024 13:31:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-watchdog@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-input@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-leds@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: mfd: convert zii,rave-sp.txt to yaml
 format
Message-ID: <172858508703.2216471.5042662583120614593.robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-5-0ab730607422@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-5-0ab730607422@nxp.com>


On Thu, 10 Oct 2024 11:42:42 -0400, Frank Li wrote:
> Convert device binding doc zii,rave-sp.txt to yaml format.
> Additional change:
> - ref to other zii yaml files.
> - remove rave-sp-hwmon and rave-sp-leds.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mfd/zii,rave-sp.txt        | 39 --------------
>  .../devicetree/bindings/mfd/zii,rave-sp.yaml       | 63 ++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 39 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


