Return-Path: <linux-watchdog+bounces-4906-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CzXHZtihGkK2wMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4906-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 05 Feb 2026 10:27:55 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE8F0AF3
	for <lists+linux-watchdog@lfdr.de>; Thu, 05 Feb 2026 10:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A639300C92F
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Feb 2026 09:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F0138E5F0;
	Thu,  5 Feb 2026 09:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqPt3txF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509D137B40E;
	Thu,  5 Feb 2026 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283090; cv=none; b=avXD+LWTwO7rlUbHaxE8IL88axdvrlUfZVWWU1qu7Vr1Cbwo/ozqsCVLTHYDxkaqM+TyMsiYY4LN0T53x3saVP3hZEbPls+j/ulhdbDeLR+UTEynnYUs1tkE7owoO0bQZ07ZiRMr8owZj0GEuplovizCbVsZcfbV5fstNF+GMXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283090; c=relaxed/simple;
	bh=MIondRexAFNOOZkAfp9HG0MC0jg45UwMMDTDXejN0W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qahRasR74nfjE+cmtg/xFAkGFTtiQcv1YqModTHKUbZNOEPl7GkXcirqfqXF+AblQcTMvQpffWcyxskrrxQVDRL+Yg0uB2BBdG3QT3VGyzAAft0hChtAQsG9Djv6JYq1agCTHXocJfUwKFgVHY1bC1PDDFBa4y/voNxnt/ti7MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqPt3txF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A83DC4CEF7;
	Thu,  5 Feb 2026 09:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770283089;
	bh=MIondRexAFNOOZkAfp9HG0MC0jg45UwMMDTDXejN0W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqPt3txFj+aJc2xLHLkLeHaSqTbPO6PH/7h36YygQaNtCFQodBjhp2rOxNJpQSYnm
	 PLBWe5r2+YX9LeAehSfe9RR/SbrtSMhXgqeBKffjEspgHfAJgzeXTdXkdQtu3aU7X7
	 xQyV2fVSxjOZ3iwMQ6ZOZ5UjyCXtA9DGT8cpkUy2AnSD/UvYpLC6mv0JcwdAGNykX7
	 X8PMP7St0ILEGgBwGHu8BQcYPzw6Yz9cbu6ZbsCGcTKAoxG7Ev/V0XfUO0R4xhsU/k
	 BUgz7BuMeQmCVSPwxoA7mELlktMONTi+ivYqlxugjxHTNKfWWQ3TTAL75KqB2HpEYW
	 Byvuoo+ETupPw==
Date: Thu, 5 Feb 2026 10:18:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Message-ID: <20260205-classic-cute-panda-a97bad@quoll>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-1-417ab789cd97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260130-wdt_reset_reason-v6-1-417ab789cd97@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4906-lists,linux-watchdog=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CEBE8F0AF3
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 04:14:30PM +0530, Kathiravan Thirumoorthy wrote:
> Based on the discussion in the linux-arm-msm list, it is not
> appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD.

3rd party discussions without any references are not valid reason. You

Best regards,
Krzysztof


