Return-Path: <linux-watchdog+bounces-4866-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIwFHue6fWmoTQIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4866-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Jan 2026 09:18:47 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37533C1397
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Jan 2026 09:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEEE130117A7
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Jan 2026 08:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9591B2E1747;
	Sat, 31 Jan 2026 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlYxvB0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRGTZIe1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6E725A321
	for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847518; cv=none; b=S0BRo7SWd6Q1MpeXEv/rT2IVXwX7fWmEbLe44ThT74Jn+BGCq4kUgkgSmTZXvAMazWdHvimw1H+bGyqPQhFPCkxPRtFdZw46gFjITPron6r9qo1mUda8BflRwpz8MfiBLUB4xzu0wTX0kIzDHsb/wt0h5SqAHAPcSwbQiPGcHl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847518; c=relaxed/simple;
	bh=zYyXuAM4YeUBOzV+q5z2UMblwbdeOowvr19qcaF/ioA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5dc1cqoTKj6kBKiP8EU+B6f9dF2wqH6NR/MJ4viHRkovhRjx/mBgcU0yxTPSPWxK0NNs83EwQTNd9syrd3I/bQbEkJJHK+CtgzODfQk+aq7XCgpu1KKTFONQYzpRKXp5jwe6VYMFaWeIFmtAsKmNmfK5xbEcpDtfmLNKGDCQa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlYxvB0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRGTZIe1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4lfEO4058344
	for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 08:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1NTPRQF91mxy0m1hC/Sthd/K
	Nv2hoMq06wZ3tlCA/rs=; b=MlYxvB0eIyWPtZBFDFYj4xBXO4kLCXlnoafTB+qX
	65+ncMYWiF+HDT/8ocveYZtG2nZgiKSzROWfkkK+yO8ETm0/Zg+6DHKSYO7uc0pd
	D7vF4Dxxw1B5fEa5qw9gJ8yZRaLBfd+6hgBoAoNmZOHPl+s4UgA9Y3zfi9PPvhGj
	xNmflrMVFUymWVv0xv/NhUp+HC8dUWDPitlZX22Ftpvp7tbBQDouEoTrO6psL/Z4
	zw1njtTA8OMdG4XbhMhBvNeDJhZx1gE+/y1rzhKhg3nJ9Y80QJKKNp/ivOyHcR91
	AK1Jb0q98rU2CrzUm6veBvE8Oo22tKTwLRyTUgZwN85uEw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1b17rdt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 08:18:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56623073a97so10221781e0c.3
        for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 00:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769847515; x=1770452315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1NTPRQF91mxy0m1hC/Sthd/KNv2hoMq06wZ3tlCA/rs=;
        b=RRGTZIe134zgBOmxLljkzP0i7OwPm9bSugQ3y1ccVEoBTbujIG3mtdTagYzV8RM41P
         +GjbnjTP70k3XB0Fb5gDO550lINJy9fYe1jqdAfakoTcSHbhtuKC8zBXOci0ggyS/8KV
         NifPpmxLtBZSRh6AeJdvYGMxFOZoXuygB2Mj1jWEHpStfno48zO8yYsRYqQDklIRuAQz
         OSJqQXkJk/p9tZtzcu0xXq+GEz3WLmv57y2+NblCMi+iLhttXvl8fylFXHT/lHBLjjHu
         wq8W6eW3NaDfUBvRYGMxT6MqcHOvzhyQE3OzUkGaDSjcyST1PGuLwoXZhVdjb2rlxq3+
         yRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847515; x=1770452315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NTPRQF91mxy0m1hC/Sthd/KNv2hoMq06wZ3tlCA/rs=;
        b=VfuYQs5HJ6yw/xyvyTPd5y98xF2Q2wVKoXnzZSQvYUuob8Shn3Lswx8O9cCgVI4rPA
         31ot4N4E4ZMXGpdCBnIPku8vlt5Aa5+te8vqOr/iuXzpS8jOBQ4UUUoWXxAwJ0kdX9Iy
         5TyTi0yDdAHMb5qAH0ecdP75y1FqjLsMHA+RUv1NoFIU9rIoFF8c/bC15tmhEhTFrhXh
         tsZHFPKIkmhMTRZvbRbXjzfvoO0lKD5olwRCCTBX6OBP3wIE5XO7B0BjiiL4XL63wpcu
         wExh2OgvtvEWZacOaLZSxefVbr+qDwUslIAF4738qQjzQkjBReVZjkXiY2C5fF3+YGOn
         vRXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFaewg9whTig7WO2rPwF5hXgGeVQpQYJI9rj2QfMXhS/rp2qVC2h0Zns9a9VbnQVrgKzgUJTSeekwlAwp/vw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4qkU9vLGHZ19KC2pAJ41vjgItNCquu52WqBGObLlJyB8kbEe
	uQUENX1eY8NzBag/J/YhqiP/ho5Yps4U9xdYGR5I2Gll81AjQRWP1kc/rCkdM2lM0Iou5yCMiJ/
	7eUT51wMhqn7YsU948WIXiC7YcPgAT+xdcuEhO07U+RPVD5YBHQi7DFz4Lif/WaOh/Hm93w==
X-Gm-Gg: AZuq6aKEHFdUsjAWiDTSMh5DuQruPqA5f+N/M/dbwFi8kWXTsVwYske1PVAUtG0nXoh
	RyDqjb4dhGPq4v3pYMm/nWGnuUlYPLe5xvg11KerBvIZq1Yih2Um3Ibso70u5j+fdFERWwIiPLN
	NER5zpSP8qBSpsONkh4FXMsXWm8WPlMbbAEJZdKVVI6I+c7o1GDCmZgG18Dof2COpgE81BHxfo8
	2jorrZB/gFAwTqBYejifgVK6MRm6td710QUddz7waoGU8gZ18PCTEU9EaMEDDq0V2qLx0d0nSsa
	gbMZsaQb3uiKXegvKYmJetAx1PHnp2ogKYC2bMiLArcsEDDn5Im5syyVZq4XUPAo/Zgsa0zMx34
	ylGVU3K60SVHI0rSbjYAV19B0uzeA9sRbPhvSrpg+dcL8VecjBpbpOKj8Y8ivRDrRTsJsHMuVJo
	aA/6C1dvlmR6Xt8XkC0EY2SHI=
X-Received: by 2002:a05:6102:c52:b0:5e8:1dcb:4dfd with SMTP id ada2fe7eead31-5f8e236b9fbmr2091767137.5.1769847514889;
        Sat, 31 Jan 2026 00:18:34 -0800 (PST)
X-Received: by 2002:a05:6102:c52:b0:5e8:1dcb:4dfd with SMTP id ada2fe7eead31-5f8e236b9fbmr2091759137.5.1769847514528;
        Sat, 31 Jan 2026 00:18:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07488805sm2244188e87.28.2026.01.31.00.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:18:32 -0800 (PST)
Date: Sat, 31 Jan 2026 10:18:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Message-ID: <5zqxloovexknbuhknbafc2trf66d6zwtvtkhjbchmbndxg2j6u@3giwqjkd2vl7>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-5-417ab789cd97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-wdt_reset_reason-v6-5-417ab789cd97@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=697dbadb cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gWikCEODulKzl4wm0QAA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 0eZMceEt40vUtwPQ-KYti393ZC67nPH7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2OCBTYWx0ZWRfX4avN8Mf7L+ZB
 LPjPgNFet2Kcu4Uj4P4eyCujj+9R1ezpeOntIjR0/5cBp9WakLjtNd301niicAZ17KruK/IoUyT
 wT5/L+0Ev5LUTCjLV559YNg0t7ipaaBqH5r3oPTAa6gxxvUssESjbBdntZFYeCG0dZDjWsAOj1J
 LnkRYLzQKWm+I7cGjXrOL59NqANAlqdG1TH+KwtLJVxJsMsfFMOPx2evLiscGOtPKDYU7/oidfK
 YnkzOFS3S4wFcWR67T6T7hHkP0Yj0IwATQO61ShS1qGgtz4gtUQJePSyv3RZrvuBXALpj+DU6Kw
 LGxEOPO5BC2DwTIAxFQMrnCcIPAxGDDMC493rjaneZDPPHg9wK0TgDeoqS9lSdoomCbmHrYIeIZ
 nnXNpOZ6hces0XYTwqwJ9YdFRO/6oV1eb3rIYIxl41dgNXnfQoFCKeEbvjp88aDkCJOWUOKh/n5
 ti+hDsmWowsZL6AVoHw==
X-Proofpoint-GUID: 0eZMceEt40vUtwPQ-KYti393ZC67nPH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4866-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 37533C1397
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 04:14:34PM +0530, Kathiravan Thirumoorthy wrote:
> Add the "sram" property to the watchdog device node to enable
> retrieval of the system restart reason from IMEM, populated by XBL.
> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v6:
> 	- Update the 'sram' property to point to the SRAM region
> Changes in v5:
> 	- Rename the property 'qcom,imem' to 'sram'
> Changes in v4:
> 	- New patch
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

