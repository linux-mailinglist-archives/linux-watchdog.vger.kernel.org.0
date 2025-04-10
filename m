Return-Path: <linux-watchdog+bounces-3282-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA5A84F08
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Apr 2025 23:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E37CD7AF730
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Apr 2025 21:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6743020B1F6;
	Thu, 10 Apr 2025 21:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnE6spxU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E6E6EB79;
	Thu, 10 Apr 2025 21:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744319233; cv=none; b=rscpp11c93Pz2OySSFn+cwXLBd7ZXw9u3krBZhgI4yzCWpJlymwcw+pYOFelKR7A0csYJOlAYvFlaoJzNqRjii689/uLiC1Nx1UpjMPyaE4GBE6kxEq1KGOyC/I92jQbZFgNhrxlHOKffPkZlKcFLqn/9EHI80+LtCb3sMqcf5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744319233; c=relaxed/simple;
	bh=KwyzvKEFF2j5LkPa6b0yQ0XGOhj8/U4qBjPGsD96guw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZVFpZsdeU+dkMpQqtynuwyqJnzbrWjZt5RUa5TwkTleYEwWDOFunq3xq7fJgmROay6Dv2hANd10F9HFyk+LJMKJcCoFHxIMTb7yuw0dKIGkVAZrzSDlBUEMElQx26KF5diWabrhGn+5BnsUxlyGzT0KGQLRkSX5kMhwzTYOBYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnE6spxU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BBDC4CEDD;
	Thu, 10 Apr 2025 21:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744319232;
	bh=KwyzvKEFF2j5LkPa6b0yQ0XGOhj8/U4qBjPGsD96guw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnE6spxUyg5djIvitXPXVeyRhdmU+5eVVtmfhMDcYPzjQCjBYBuwmHYxdZDyXNXAF
	 qQca0offnA82uwYeRkGXieqswdVKZC81jKkc8Dkchby+7RlejDCbc+ylspa+EJfKkh
	 qEEugRAAns2xCVAj26UkSsM8eWjBDVOrJemZ/MkDVpRT3OIS6JJCPNDrCX32wLZvA3
	 sqLKfbobB2UVWOfATbGFXrm0aduOrdPOBKPNjUDa2RP0iAwkcF1HddGiNIF1g25pOQ
	 nH6G34EiRLKcQgzyjvFZ8vx486JubmUpNq7JIyep8jU3IrIJSJ9Nssc965nvhwEK60
	 ocf/0iZilHBNA==
Date: Thu, 10 Apr 2025 16:07:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
Message-ID: <174431923074.1071351.3036987096266250197.robh@kernel.org>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
 <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>


On Mon, 07 Apr 2025 19:03:25 +0200, Thomas Richard wrote:
> Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
> watchdog block.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


