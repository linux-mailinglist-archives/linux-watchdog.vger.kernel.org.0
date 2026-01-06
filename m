Return-Path: <linux-watchdog+bounces-4756-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B49CF6D30
	for <lists+linux-watchdog@lfdr.de>; Tue, 06 Jan 2026 06:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 702833015879
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Jan 2026 05:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E702DA77E;
	Tue,  6 Jan 2026 05:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fM3e38tu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCSvtNRJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D0028CF6F
	for <linux-watchdog@vger.kernel.org>; Tue,  6 Jan 2026 05:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767678959; cv=none; b=oyHl3P2McT2yng4AQFZHpOo/s+b8NYE7510T3Q+4A5Wh788q0tC3/SNObCmUFSrwsP/pDpNFjnTVoAuElPIvB3TEEq4JKEiG/R7VGTbwfupTdprqXaZFOVWlUzoWo1wIl3Onijn7F9NIeMldrcw7+MxERRcUV48lEJ7sqrmTFqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767678959; c=relaxed/simple;
	bh=rt/LoXHXTMlaubi2OtDu5txWrkRlBcz3naFRv0gOz+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drJtCyoODQZKM7RGt4mu0TiZmnegkfYi+Kjs7FxYi4k2ykCYIQ1xCbHYdaDmq97I4VwJ0yvBxNgOeSol3Hdj7ctcGhrMo8yTRLpKyPbNQxO2lxwTYP+3jaSAdaD7npK/FTRUO5DqXF15whIyk28FiK99nJrGWdp4sPgV9E130Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fM3e38tu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCSvtNRJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QPfJ2854369
	for <linux-watchdog@vger.kernel.org>; Tue, 6 Jan 2026 05:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/q01XhRxVgeVnOfeWGaC7t9O
	fwilPcF4MbNkT1jVGw4=; b=fM3e38tuPq8eNzH7IGqgaOcFuq1Ld0sw5pr/PtWh
	Z2Hgs7Y3vn1gYCd1svr6f9FRy1N7haoDLWgoJGz78yaiErdX8gSgAL4So/wjRHUY
	Lpyufyt8VlqtnXXBnwKmgMotHeNfNpUQvPInuzamCV/g3s+5AKRJ14cGTJZum9rS
	ahGH+5X0qMA3oGG8P5Lq3Q+raFWLNlDyBX6Bb7wOQ41QRAlF/ekDKbeNSKaDdKEZ
	VNUqHWyzuLNmPE64G59VKbuNy6Pc6zJQagrzdVhFBaaTVO5aSuoUKmxlr+zG2MNY
	t/0eyf0+9eT3kD3k9wwzQ6eNHaSTqnc+dDfCF5yNBQvODA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus3121-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 06 Jan 2026 05:55:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bbcf3bd4c8fso411536a12.0
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Jan 2026 21:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767678956; x=1768283756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/q01XhRxVgeVnOfeWGaC7t9OfwilPcF4MbNkT1jVGw4=;
        b=aCSvtNRJULRXkCKjPoY84ip/lyzjCwtOGgRFx4SDQqTt84MSoNDRn4H/NKRQd067I6
         HswQI30Bncth3qBFgIdaxJQ0MwNUEtpDJYbsH+s3DYzb7uKRJCoSpxugOGdfX5QqnolF
         5o7psJyOPBrqJLIMWjRiWWRJfQ3oqRGtniwFCAZUO+cVerhvODMp25UTbU1yDFKa5a+q
         YvUJDN9Ef+zv5l0Aed+LPFGh+YAV4sEz7Rp//5OvDAIOAjYatZq3oJ7WWY1rWnwWVTp4
         E+kU9s1EZMN4IJR1G99s021+rV02IzdMC8RBVNwJxNmVMJAPPKfGHT9G+DJUem50/KP9
         fWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767678956; x=1768283756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/q01XhRxVgeVnOfeWGaC7t9OfwilPcF4MbNkT1jVGw4=;
        b=D7V25co5G+EfnoGEaHSwvpZNyE2lk9Egpu4Y1Ggk5Vt+0ABKRdYPAlftiPpiOsJYV5
         Ucu28O1qDgpiu06FsuE1iqTpEh9dWdn0UY0Tx9eTZZs+MQ4VyferHzfTNuxuf1E1Dn7w
         Kutb7I3L1DXX60ymSsbnn6Ky8n1ERbMtcm1YQ2b+m7Troz8tJxQtatmIfq7CPSHlDrSd
         HyPa7kAzxSGSkoFFgY2lOzX4VZ6Auo8CyFEjmGo+BKkBvPATBFrh6VvGU7cw5/NP5hOs
         cWeT5irz0goV7QrO68b6AUzDkcYJoO06iv6BW2NEX18EaJhLM+Ve/gz7ntYdB9MqaXQ6
         HObQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqbUUEDxqSGz9fHmq92neu3iRqSnuvW9BfG5/WgdnD5yfJhH6xryGV5b/X2CFJgUGz/SalKr+XUGqrVWlNIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfmbr5He9KWRb0MbFC/RsZJDg9xfG08+MF/oEradlgrdRuM2wm
	/FJIT8MA9nFcnkH20jlYfkTpfS1mvjTywcUDrSlCrH97EaMxvoB+zcPliuFHeU8u+uDUYtdgtdt
	dRAXDgxps4umu8vGxx+1fR/uN8aZqBKvkxINn2Adkb3LOFJMyk7KvoicHz8uwQ8W9keHdLw==
X-Gm-Gg: AY/fxX5b0cEgeB9Wg1JNslBMCUIUNjTnkz77rIoMXBoJfuMLuMrsRgiQ4wN+BkzgIW6
	NXjucJcdIhOlU9QHmOjHHZE8fJfRisvccmUDY5AGKkHrVeVcWFlnhx7Cx1JxmPuWB2oiLFG7/lS
	Jm6+hh2/iD+WnDwniiqQQKOmPSsPJB8xpVkWR7uVZWgHi4H9vcqAza12PgzLX1+8IrWj+NCemjf
	XSuK5aynng4K850jjbh/weSjEHYhWTSEpvnA4NqLBfzXg70iW4W4C56oNPceXYZUJVkbrFE0HDg
	xtnsOqBO/JXMP0MwcNz7oGyHSXjbEAekq8oNbV2XAWsl4BGiq36KyBVGNYGPBYAHhP+/DD9gLTo
	XyzTJmUCLRF7eJGByh6OlfuX+1vUVUpvCJUV/veIfHW8=
X-Received: by 2002:a05:6a21:7486:b0:366:14b0:4aff with SMTP id adf61e73a8af0-38982b715d1mr1734118637.38.1767678956162;
        Mon, 05 Jan 2026 21:55:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDN3Pd20TtRRi017rdEF4LM4VhLCzP58V1UhTLFTEXu903JedqbwdMGPxflYM6oezPUSGUpA==
X-Received: by 2002:a05:6a21:7486:b0:366:14b0:4aff with SMTP id adf61e73a8af0-38982b715d1mr1734092637.38.1767678955647;
        Mon, 05 Jan 2026 21:55:55 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28f678sm1171577a12.3.2026.01.05.21.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 21:55:55 -0800 (PST)
Date: Tue, 6 Jan 2026 11:25:49 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v8 0/2] Add support for Gunyah Watchdog
Message-ID: <e9e7dbbf-f7f0-4b66-9e3f-7578441dfc5a@quicinc.com>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
 <6a8f5d62-f6ea-44b3-9baf-acfbc1e58efe@oss.qualcomm.com>
 <992d46b7-b053-4a9e-ba04-f5653525a891@kernel.org>
 <43e48560-2848-4474-b858-a3d15944e2ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43e48560-2848-4474-b858-a3d15944e2ee@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: m6BRG_sexWsDxIaDqvAaA0M6AeeEYaJ5
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695ca3ec cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=H7LiKOkp3v_ihm3-CiIA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: m6BRG_sexWsDxIaDqvAaA0M6AeeEYaJ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA0OCBTYWx0ZWRfXxVX+tmifDsZM
 bwGK1zNsrFXJLXxyUVH3PsPyAdEYq8zyD1rQUWyhsmIDwSeIolZAnNkVQrNn1T/p46md4fXfBvS
 Ed9+1MHYfs50DjiupY98nH16dQ1sD0XRp+AnKZIp36AO24Lv31KhUKbeGT6VhTbaKtBLfToJetB
 Z1rqyzSk0TZq+ZzSUEqwcO1MIJ9yicX6I188PLDc/a3cnCYWc1xxuv65VzBpEPnjGtmJYQ+Xw0S
 5Sld+H+oS56wHGIWhl7MQfnJ6DE1/aKbsOCFhLJyLB1ymJdsvVm9RikaPhlvGhbNzPY6RYdPFXd
 aseRy/TH87o9gh+s3hT+jU1m4BLGqAOqbfWubEifvCAWZOAmhCmU/NbFnkAohvxoVrr+UlE17L8
 VO/TYmdVPPUCpjO01dbpFxx648O2lBcX8sLU0wqUelVvFZLvfFFqDkHpOjFSVdEfK2xYnqnNCMD
 hVcXZbAjWFkgoP45eVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060048

Hi Bjorn and Wim,

On Mon, Dec 15, 2025 at 06:30:47PM +0530, Hrishabh Rajput wrote:
> 
> 
> On 12/2/2025 9:29 PM, Krzysztof Kozlowski wrote:
> > On 02/12/2025 12:23, Hrishabh Rajput wrote:
> > > Hi Bjorn, Guenter, and Wim,
> > > 
> > > Just a gentle ping on this series.
> > 
> > It's merge window. There was no point in pinging just before merge
> > window and is even worse to ping now. Nothing can happen with this
> > patchset and such pings is only noise.
> > 
> 
> Thanks for the guidance and apologies for the noise created during the merge
> window.
> 
> > > 
> > > Since the patches have received Reviewed-by tags from Dmitry and
> > > Guenter, I wanted to confirm the merge strategy.
> > > 
> > > Bjorn: Are you planning to pick the QCOM SCM changes separately through
> > > your tree, or would you prefer the whole series go through the Watchdog
> > > tree?
> > > If the latter, do we need an explicit Acked-by from you for QCOM SCM patch?
> > 
> > Where did you document dependencies between patches and any non-obvious
> > merging? I open cover letter and there is NOTHING. I look at patch
> > changelog and also NOTHING.
> > 
> > So if you tell us nothing, why would we care to think we need to do
> > anything special here?
> > 
> > You must explicitly document every dependency, both external and between
> > patches, in the cover letter. At least cover letter, some people (e.g.
> > mostly me) don't even read them...
> > 
> 
> This is a miss from my end. The following information should have been the
> part of the cover letter:
> ```
> This series spans 2 subsystems and is split as follows:
> - Patch 1: QCOM SCM - Register Gunyah Watchdog Platform device
> - Patch 2: Watchdog - Add Gunyah Watchdog driver
> 
> Dependency:
> There is no build-time dependency between the patches, but Patch 1 is
> required for Patch 2 to function.
> 
> Merge strategies:
> - Strategy 1: Take both patches via the Watchdog tree.
> - Strategy 2: Take Patch 1 via QCM SCM maintainter's tree, Patch 2 via
> Watchdog tree.
> 
> Since the patches concern primarily with the Watchdog, I suggest we go ahead
> with Strategy 1. If this is acceptable, I request an Acked-by from QCOM SCM
> maintainer for Patch 1.
> ```
> 

Is it possible to pick it up for v6.20? As mentioned above, both patches
don't have compile time dependency, however the QCOM SCM patch is needed
for probing the watchdog device.

Thanks,
Pavan

