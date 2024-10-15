Return-Path: <linux-watchdog+bounces-2213-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B0899EFD0
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Oct 2024 16:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E115281DD4
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Oct 2024 14:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CD31C07F8;
	Tue, 15 Oct 2024 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmvoxCXy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD7F1C07C3;
	Tue, 15 Oct 2024 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729003230; cv=none; b=bvUz8GGvjxuAm6hW23gzfGJU4r8Dc+DMydCO1dF+THtWRYJRrAKYoQ7fhMo43q6S+dEPHQuCjGDhzq74mGO6jQxbjDRAySKgxFT5bnul5A8MLeacYA2+jzqjgK3S4fexbMxNrwjc5UYz5UCln0Z3AuaGEpz51Qos2fmACJ5u3u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729003230; c=relaxed/simple;
	bh=k9GQx+65Wq20zwo6mDcDTXDu7hgnpwGe16oAYfUcGic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hL0+/U4dIAy8i4XmC0cFdPTGJtxENAjC8wuvT/nw0zpa56XdEa6F1gH31VXWo7AUYwvyr9PQ5Q2rvDB88tBNBfOC3wKuqtKZ4tGs2xd5lMCWfcw6UdmigUtRzlALCMtTE4vPRvF1gjQ/P6dOCkWNVMA0JmKmwIBRHrZgJJrlhz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmvoxCXy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C0CC4CEC6;
	Tue, 15 Oct 2024 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729003229;
	bh=k9GQx+65Wq20zwo6mDcDTXDu7hgnpwGe16oAYfUcGic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bmvoxCXyzcuHs8IaLgwXNaQEAqgjuR/4aetJoBgdpYzKbLTzcUPgGVYOrsRPXrBKr
	 pxcF7tQMT47Cb4gixPqGeGYtnRn8aYBQy4Q1eaB8g3diTGYLGK1C6XLmMBKjzOJEN3
	 nKndgNEAjLPO8Hkl4oMGKW9pjBzNNqL7wsuq5ziwCJD8FP75q73oySRmkjk2s59D/P
	 HwCVsA56BjDlG9g+LgrpgR9FS+lZ0G0K93Y6MpA8eM5qVKu6P9dov0QUQz6a1Cfqvb
	 puc2AirCy8snCK4bExieqHJBO6O+6aUANCrSktdpKhLlHWMH30yD4dwfwsTUSozHpX
	 vC2csQrdiQ7aA==
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Frank Li <Frank.Li@nxp.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org
In-Reply-To: <20241010-zii_yaml-v2-5-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-5-0ab730607422@nxp.com>
Subject: Re: (subset) [PATCH v2 5/5] dt-bindings: mfd: convert
 zii,rave-sp.txt to yaml format
Message-Id: <172900322623.629898.5064045014135877171.b4-ty@kernel.org>
Date: Tue, 15 Oct 2024 15:40:26 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 10 Oct 2024 11:42:42 -0400, Frank Li wrote:
> Convert device binding doc zii,rave-sp.txt to yaml format.
> Additional change:
> - ref to other zii yaml files.
> - remove rave-sp-hwmon and rave-sp-leds.
> 
> 

Applied, thanks!

[5/5] dt-bindings: mfd: convert zii,rave-sp.txt to yaml format
      commit: f4b00ab2c29960961f9641be8f3e8ba4960fd849

--
Lee Jones [李琼斯]


