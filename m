Return-Path: <linux-watchdog+bounces-2617-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF39FCCF2
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Dec 2024 19:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1450E18833D9
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Dec 2024 18:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D78E1DED54;
	Thu, 26 Dec 2024 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSYYD9iH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54B91DED4F;
	Thu, 26 Dec 2024 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237664; cv=none; b=VRf1KaH+Z7Juca87wn3iMnljHXVnIpE6HiyKHwwEyN98SpJKJ/GhetOx84R6TnjGHeF+1s4s17M/e4/E5SZwYNz2gymX+/XsbUANqgkE76eJO4cKL6s7/fN5S7U/MaJJp4JH3qa0+hiU54tb9PU6XoWW79fxjy+wbQXKFYwBpa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237664; c=relaxed/simple;
	bh=3rra3OEL4T2fPfqzANKvKHQ9vGwn5eoOrpfGXhXCcco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W/gbT9Q8xy0r+U/UDY+wUE97CtbLELl4YjhLdi9qkSkJ29aqgg+VcGmzHIoXwILqq5j9xmexjJK7aMldPu5rpk4IJSn9mX6hY7OTcZIiwoLWIdi+WxLtR3km8KUZxU0m/njz0qn2ceCF9iRfr3AX0+HQqzyUnRwLIfPV6JJM2Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSYYD9iH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E7FC4CED7;
	Thu, 26 Dec 2024 18:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237664;
	bh=3rra3OEL4T2fPfqzANKvKHQ9vGwn5eoOrpfGXhXCcco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FSYYD9iH9trTAby6FEylCJJBFPAVynzD6cC+dw/nNtLhlV9g8bbDyOk4h+Pfmb2Sm
	 t6N91CDOYpAx+S5spA+xxAtvGInpUuNEaJVJY2pHDsbzQ3f82ELSCO/CbxUDV2pI9k
	 6KSd/iMWapwrUilVpDByzsClevzP2CzZsdgnDSko7kJF++TtVzKhA/QKVeM5xCFg+s
	 m0DS0i/W+wolfxEMpAX2XjoXIUp9FrnrSxmql0K8QFrTBy+NVGr3rzfldB2HVFq8P0
	 ztiWw02FUiXZzYzXhi6jn3GL7/W5N5za6f7PW1tNoHTIBSy1Y8OzJ7iKKYHQ31TXfY
	 LeE2NF7arl8AQ==
From: Bjorn Andersson <andersson@kernel.org>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	quic_rjendra@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: (subset) [PATCH v2 0/2] Add watchdog support for IPQ5424
Date: Thu, 26 Dec 2024 12:27:00 -0600
Message-ID: <173523761392.1412574.3549863619757179987.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241121051951.1776250-1-quic_mmanikan@quicinc.com>
References: <20241121051951.1776250-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 Nov 2024 10:49:49 +0530, Manikanta Mylavarapu wrote:
> Add a watchdog node to the IPQ5424 device tree and update the relevant
> bindings accordingly.
> 
> Changes in V2:
> 	- Fixed review comment from Krzysztof Kozlowski
> 	- Detailed change logs are added to the respective patches
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: ipq5424: Add watchdog node
      commit: 825b203296a845a1093722062ac6e5b655825704

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

