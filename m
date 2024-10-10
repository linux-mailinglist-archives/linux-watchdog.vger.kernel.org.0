Return-Path: <linux-watchdog+bounces-2183-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0E4998FFC
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 20:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54E481F211A8
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 18:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412EB1E2821;
	Thu, 10 Oct 2024 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Io5whw3+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDAC1D041A;
	Thu, 10 Oct 2024 18:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584703; cv=none; b=Vw1zWZ8OWrWOjw4R3GDkMHoZtorpotdePqBbh73F8m0aYNT3k9XN9pa369TeKpTXMY21IN7YqxijvZ1qarydHRXy/ZploPFagcotR382VBZn9ZN5hOE7AyDKapATaW67B2+Pa0onhE1rmuWnehF9gdC0o1RVaFczDEJ7hARg45Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584703; c=relaxed/simple;
	bh=yau4Zwwh28Xwhwp4/VRnZ6ioQPsselwwE4jb2ccYMUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxpFsqWAJsAAt8X/zw4VFXI990kE4T/IoGYV3/l0F+d34iDswOYioaFPpScZDqp11yRKhXmVRqgLe4z9+JSCgRrlk948VydjFkeXKYFY6CtA4NhId1MZSstIxsmLWS6QROSyIfiURspwIUwiAnpKNj6/+SOWn6kRyeak2xe2JqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Io5whw3+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B32EC4CED1;
	Thu, 10 Oct 2024 18:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728584702;
	bh=yau4Zwwh28Xwhwp4/VRnZ6ioQPsselwwE4jb2ccYMUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Io5whw3+2L2z8Atkhis7ywyJv283No3ZgR9QQJEjvkESrjz8kydFTGOPrm13QFj28
	 F0dGD519bVrJ/oltrO37x0UdbWwbyPpstVxh5cZnQ8h8pLgMXydPA9kG8QVr8wDZsr
	 83qs4gPGifnYf9nYVRF36IlzPVTf58fS0u/Pp2YxTytpjEuUhYb5SMDlLAz89EYPV0
	 NZdzV9W2N8pDDVZgZ/z7h8bCj+qETyv6PQMbgA/vbcp+g+cnGo+hc0h70c7hXqXYnT
	 hCGPSdTI1FEDE3bq4fqOsUmcD/w6wsxe4LfwGPmiPWxRTiVkFIjiU4/piG3oWOSFLn
	 wQrMHfcKOlYzg==
Date: Thu, 10 Oct 2024 13:25:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: nvmem: convert
 zii,rave-sp-eeprom.txt to yaml format
Message-ID: <172858469861.2207905.4713553771222478929.robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-3-0ab730607422@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-3-0ab730607422@nxp.com>


On Thu, 10 Oct 2024 11:42:40 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-eeprom.txt to yaml format.
> Additional changes:
> - Add ref to nvme.yaml.
> - Add reg property.
> - Remove mfd at example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/nvmem/zii,rave-sp-eeprom.txt          | 40 ----------------
>  .../bindings/nvmem/zii,rave-sp-eeprom.yaml         | 54 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 40 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


