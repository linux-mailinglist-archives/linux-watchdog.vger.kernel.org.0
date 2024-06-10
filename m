Return-Path: <linux-watchdog+bounces-1114-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4E2902AB3
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Jun 2024 23:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC0141C213AA
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Jun 2024 21:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C701F6F311;
	Mon, 10 Jun 2024 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAz3+OGX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBE66BB33;
	Mon, 10 Jun 2024 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718055494; cv=none; b=hRng0WeN8CA5oLS/AYMXmfPtGzrUT2bWFQ3d2e/zX36DtKvhMDf2UquzHjUbujYTC8DFdAH02SPBaxckGfGSWQ44UkmYfPP2cxv0pTqKUu8SJMpb4QSPBrlx7oBHHdwwUq8lfsIN04MBL1lNEzIfbPfj3dsfjdGUOEoa/sq4i2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718055494; c=relaxed/simple;
	bh=iS+f24vXNzu4B5CkXlWd3tuO2O54byUj8yfLNwSgl0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+CBldef9nVR+4XFQY1wcTkl02SdHeg4tO2KvcFrP+ISyZwo1hJgeMpocYIgcz93Icgd07iEPsZkTn3Bn9iHVil2aoWH6NWUJGoyos8E4aFWuUv0EcaB+g8wgcIBS7E7dSGqdLCsaqHEFye5TwwIYNl14UDrTPbbr8/iFppVHrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAz3+OGX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203D0C2BBFC;
	Mon, 10 Jun 2024 21:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718055494;
	bh=iS+f24vXNzu4B5CkXlWd3tuO2O54byUj8yfLNwSgl0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAz3+OGXKsWW9qcaNDnCoZ0CMB5Lp50iQ2ZEQabUOmgOwCF7LgJ47bTrDCr+ADblc
	 xYmKmgwsFQYIHEVkNhGwf16DhRsLUpad2qDpnkHw//GtUQe0KUgAITQYPhw3euCJzo
	 VMuYsBFqJe8hFF6/ZrAqlOqNl3cA4/6z0yWk879vn5WOlTorT3pzZmIAHPevS33ESo
	 ms7EvVeDB6f8bvhDBhSP1frGU7xq8aKz9GeE7/6FJRWeDGrPY50f/9msf7GVRCgJbR
	 i7cYQb2VHH5r+FB39zeVMtUOUdHUwda9XSLTMVQlZZOu7NBMV+cYok0UXLZoXDrISz
	 BQ63x+2w4DW0w==
Date: Mon, 10 Jun 2024 15:38:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shresth Prasad <shresthprasad7@gmail.com>
Cc: Shresth Prasad <shrestprasad7@gmail.com>, wim@linux-watchdog.org,
	linux@roeck-us.net, krzk+dt@kernel.org,
	javier.carrasco.cruz@gmail.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	skhan@linuxfoundation.org, conor+dt@kernel.org
Subject: Re: [PATCH v2] dt-bindings: watchdog: img,pdc-wdt: Convert to
 dtschema
Message-ID: <171805549065.3119295.11660443713191939962.robh@kernel.org>
References: <20240527195811.7897-2-shresthprasad7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527195811.7897-2-shresthprasad7@gmail.com>


On Tue, 28 May 2024 01:28:12 +0530, Shresth Prasad wrote:
> Convert txt bindings of ImgTec's PDC watchdog timer to dtschema to allow
> for validation.
> 
> Signed-off-by: Shresth Prasad <shrestprasad7@gmail.com>
> ---
> Changes in v2:
>     - Remove blank space
>     - Add item list with description for clocks
>     - Drop description for interrupts
>     - Drop properties assigned-clocks and assigned-clock-rates
> ---
>  .../bindings/watchdog/img,pdc-wdt.yaml        | 55 +++++++++++++++++++
>  .../bindings/watchdog/imgpdc-wdt.txt          | 19 -------
>  2 files changed, 55 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/img,pdc-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt
> 

Applied, thanks!


