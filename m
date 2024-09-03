Return-Path: <linux-watchdog+bounces-1687-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E7F96A51E
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2024 19:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 951F628137C
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2024 17:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB7A6F315;
	Tue,  3 Sep 2024 17:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJREvbue"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A2D1C14;
	Tue,  3 Sep 2024 17:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725383654; cv=none; b=B3paqwNek9ZtSNpP7zWhBSV0V25L4Ru7EWBEyolvMXPQv7qGEX6K362zLbxtL/7oWYZg5gQsNtCChMqdsUiSjURe1o2dW6WHlP6uYHYgNQWNuHT/8ci8afMMCAG8Wz9jYesUB/BWx5c7XgjrCHis+o353YIedBgQ5OvbL9MXDws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725383654; c=relaxed/simple;
	bh=eGwm4taelSh/WXzqN+PU1w4rQntRFxVVS/ENxfgCBQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lP6Tg4gMGmNum2bIuL0f88ztwD6l6YPXnH9mamzKg/0zFp9+lucMMLVJdFcSmdyrUzqVrwFaMF6DXFMuEvFmR++Mmo0WhNlLHzTYF8IQ3nwIazUKDxpAxE5xUBDUnqbVXBN1eL6OF1r8VEBfl/RXP3W67zaqgtLcOv2F4fDynwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJREvbue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A60C4CEC4;
	Tue,  3 Sep 2024 17:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725383653;
	bh=eGwm4taelSh/WXzqN+PU1w4rQntRFxVVS/ENxfgCBQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJREvbue78QlGh2r2sHgxA8lg6oHcpVyMzlsSbxjcBOfaNLLoHej+xYDrrsZ5hXhT
	 vvxOn3olgwxKrFaCzxYywN+2of8nYp/XN7wdPXEknsko2NBZgzsBMHEik3wp7eW/jJ
	 yH9uEAkqiayT7WjHW02fQte9o2QJBLerWHryA/ZicPHTWH89/ID1B06h4tvtrBDadn
	 HgKjRlAfVVGoA34SNpGv90RlPtRxfO3j5JNwVcIeioBUD+Xx3fx7TEO49aG9+QPDxv
	 C+IFJIXsV9nVNyuy/kbs26Pn3iCByMfAl6KFMcYaOscggqF8JvWk3QU9yl8P4+YPe8
	 rhfR805npq6Lw==
Date: Tue, 3 Sep 2024 12:14:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Zapolskiy <vz@mleia.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH] dt-bindings: watchdog: nxp,lpc1850-wdt: Convert bindings
 to dtschema
Message-ID: <172538365106.1746854.14927974412674667837.robh@kernel.org>
References: <20240814061210.56213-1-animeshagarwal28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814061210.56213-1-animeshagarwal28@gmail.com>


On Wed, 14 Aug 2024 11:42:03 +0530, Animesh Agarwal wrote:
> Convert the NXP LPC18xx Watchdog Timer bindings to yaml format.
> 
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> ---
>  .../bindings/watchdog/lpc18xx-wdt.txt         | 19 -------
>  .../bindings/watchdog/nxp,lpc1850-wwdt.yaml   | 52 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/lpc18xx-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,lpc1850-wwdt.yaml
> 

Applied, thanks!


