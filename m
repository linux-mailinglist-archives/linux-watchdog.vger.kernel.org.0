Return-Path: <linux-watchdog+bounces-4822-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBM3I847cGmgXAAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4822-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Jan 2026 03:37:02 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5061B4FDB7
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Jan 2026 03:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 93B10667467
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Jan 2026 02:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A7F304BBD;
	Wed, 21 Jan 2026 02:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHGwGUKF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362D5280A58;
	Wed, 21 Jan 2026 02:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962960; cv=none; b=o37FDVKMmykLyuuYHYgFITnELVVZGSPUy23XQlcWPnoaS4p0aPDf+HNh6iq+vIPov3U/33+KjLiVKdieikrbzXf+116SdNYlaFvjCDV6GUAys8YIq2ErhK1PCFRqHVAFYiuoFOJLZpRWDcOFTTNv+cpwMDb6h+BQOm7XEjEfcP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962960; c=relaxed/simple;
	bh=sbPTIWew4vQwvO9ifzVqvJA6OQEcLFxftNmgMIjEunQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aJGztBMCZDib6aAhpi7c6SIAQdaaTyLZVS1qfGj/rjJkgtbpdDzhMNnGYMoAwdvXjZz9F+ItBPOSqyryRxbT0iPg4N7P6kWRB2zrcBAat4XqHwcD8FDghoGEQbEScI6dDvNx2ROaTFTe51ZBgL06v/B3/iUS49o8D2kY9Hv0/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHGwGUKF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4002C16AAE;
	Wed, 21 Jan 2026 02:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962959;
	bh=sbPTIWew4vQwvO9ifzVqvJA6OQEcLFxftNmgMIjEunQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iHGwGUKFYd9/KJL2sHYqinKrl57/aoPjaJORgj+6eSrDY34Tg02du4nP4h7A2v7KY
	 ovAQti4Dc3qhJOLfxXfPVifD9ONeuEL+SbAy4Wz9WUcGVkn39//HtUtwjP6ammo9n4
	 LhNtCZd3RN3TP9LP6Dy4RgdutqK/4Y52FP+iMIIHUaqHFJzoZFz2fZWhn81khhiAVY
	 ATOxgoOQekFYEjxwS/VF+AAoyFPvJclULxZyupBFGUuNKnLowFjCLLCeisTo8wEg2Y
	 JOszSl2DE4WSKBWfYLtIatAaBxVVve3eQpyIzbAq2+Oe1FyPj/L5r5fY+sC4oQ+ZbU
	 NCX0qg1WG2WPQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: x1e80100: Enable APSS watchdog in EL2
Date: Tue, 20 Jan 2026 20:35:49 -0600
Message-ID: <176896294109.1060469.3539173222403649911.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
References: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4822-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 5061B4FDB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 24 Dec 2025 12:45:19 +0200, Abel Vesa wrote:
> On X1E80100 platforms, in EL2, the APSS watchdog is accessible.
> The APSS WDT HW is compatible with the one from SC8280XP, SM8250 and the
> like. So describe it in the SoC dtsi, mark it as reserved and enable it
> the EL2 overlay. Also document its compatible.
> 
> 

Applied, thanks!

[1/3] dt-bindings: watchdog: Document X1E80100 compatible
      commit: 6609c1976e64b6ce31fc2de11136dd7703372f20
[2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
      commit: 4da4883613f62d4d60ada443d09ac36644f27d8a
[3/3] arm64: dts: qcom: x1-el2: Enable the APSS watchdog
      commit: f010e0b997035d82586e32e3427d88ef76edb3cb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

