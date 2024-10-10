Return-Path: <linux-watchdog+bounces-2184-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3549990DD
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 20:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02CDD1F2138F
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 18:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EF6205E30;
	Thu, 10 Oct 2024 18:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cb3mnInv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1537C205E22;
	Thu, 10 Oct 2024 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584794; cv=none; b=GhbN6kjIhAXSRsh5WtJFEsWsoLqZ3GkKw9fDuLlVnvkfY/jt/16an/XTQmdw1qrpOx4us7QcSp4qsP1Q+37z+q15WbbnnI18h+zWsWPN5O6+GMyl7RWDlI+Wd0nvfSC3yO9HWl1lE02G/ojhfzmishl3Y1EI0twwDiJDLxr3VPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584794; c=relaxed/simple;
	bh=SLgQP4nHhIwWIByEbqhg5Xa/zjdOSYXWAONY+e2Leu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/PRS+fmeTQwKRjTlttO7cdT51C4ZLM37lfQY5AjfUn76qhSaw1N+8GPVv16cZA3PdmwTOUMDlrfI3OYXm2OIykm7/mJEYBdmldWntSU40Vz9/QfoYFn/weDl0UIMa14jojV4s+dan9nXGO+oBqJvz396jehSgtq5kz4KARo4oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cb3mnInv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71710C4CEC6;
	Thu, 10 Oct 2024 18:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728584793;
	bh=SLgQP4nHhIwWIByEbqhg5Xa/zjdOSYXWAONY+e2Leu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cb3mnInvNxBWfb/GZNLMHTYIvTgm9DPUAvr/TkCs81u7z1g8hLi28Gy65d960EGw7
	 AvbZ2YneI79Fobjv/NOKqkOI0LW+ftrNR8tY7Zeeqj8HKu9mCd1cFcAgMz9rVDSefg
	 k25qGPIy3nvatlBnuSWGpkxIAKxxBbDWMHfg5MamBlTgBhfNfZNwFws7TrQ9O6xv5W
	 tgEugf35Fif/Lc1muyihsEraMRkG0hSgj3bnOWdT+imsSTCbgGC5rsqIJlQevesj6B
	 dEpD+D+irHjDI6JjflyS8Q56O6pDNLVnyNai9jq3xFCus+sJiGNFzG8tHm0g8sow8A
	 qpgDOSkO+CDhA==
Date: Thu, 10 Oct 2024 13:26:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, devicetree@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: watchdog: convert
 zii,rave-sp-wdt.txt to yaml format
Message-ID: <172858479156.2210042.3356891364653702885.robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-4-0ab730607422@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-4-0ab730607422@nxp.com>


On Thu, 10 Oct 2024 11:42:41 -0400, Frank Li wrote:
> Convert device binding doc zii,rave-sp-wdt.txt to yaml format.
> Additional changes:
> - Ref to watchdog.yaml.
> - Remove mfd node in example.
> - Remove eeprom part in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/watchdog/zii,rave-sp-wdt.txt          | 39 ------------------
>  .../bindings/watchdog/zii,rave-sp-wdt.yaml         | 47 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 39 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


