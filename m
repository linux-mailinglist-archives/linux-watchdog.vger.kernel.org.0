Return-Path: <linux-watchdog+bounces-4809-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72ED1A0BF
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jan 2026 16:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55822302413A
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jan 2026 15:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897C7342502;
	Tue, 13 Jan 2026 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K71Cqt9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OByXrC+P"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0B33043D5
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319913; cv=none; b=CVkVg+qAiLYYmkBY9/Qa9+3ispEbQKTe8Xn8XyDkfzu0s4N5nTz+Pii10d8XxMeYeS2mwh/zJx8WXLwJ+y4yiyH9LmtLUP03vq+NLXwssoyOuCjzrIT9O5IGbxnHzi1W7haBTPRYELQhIkGeSWAJcBX2HMy3xKzPeja3uqE8ep0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319913; c=relaxed/simple;
	bh=ZvSMBuV+dRhDzKRtELRaYXIdxCJ1uwiBrY4sMZmaInk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fhly/rLvkgQ5nSbIXRgF3UY/M+ChxK5HL3ttDpJ8ATjXjQCdf3HsHog91dp0KnVfjyYbuuMayUVefyR6V/l3DoyrL18xDeuskX3GuEud+OAqDp47lk+bIq7ZRvmxPTSWMyvwcIIrxjLrEl+OcLHfP+Zil4ixlCowaGmvWgjclC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K71Cqt9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OByXrC+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DFGpH93299900
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 15:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xIUohOSEadvIpJ/WOpqMNMkz
	cciSx3DWJXtqCnl3QmM=; b=K71Cqt9bnCe6lgWVNi6QvclVAeHrL0tAOqYjnhys
	tVjQiTfR5N/0b5J7II9ITTJRRuoQ0di5n4sYU+LuvQHUXVG0p6rfXHaFviDxL8Cn
	qbBpE20ZimxgPpYspunD8zHSXZj387MSG5NOCfqm6tRU9X81feeQTdEU9lnw5xFr
	5aUZJoIHviRBNfyJvEeoGJpjOi5/VPlnOqWyluxRbpxO4vEvI73N2oZqA+RstK2x
	8v/Op957BPuiuWi2RQSlqnHk7Hx6NKcL8jp22yDWPIzy/COJ6FK7zgTfvveJNEJU
	M7Esc9IJwhHKpimfja2M+D4uy16TZxS/PeoEX60cKTXOWw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jmbdyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 15:58:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso159728855ad.3
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768319910; x=1768924710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xIUohOSEadvIpJ/WOpqMNMkzcciSx3DWJXtqCnl3QmM=;
        b=OByXrC+P+HgmCNGVBpbbLVZV+BQo0NFs662IviIn8PdwRm1XVsxTrtilOYkka/b1el
         wB4H8Vl4q3TymwnFXQ9K0bLrCHmvzkJAwUGlbv1q6el2vsffNs4cSwkb61C8XWx8y/DN
         EcYOZhZs9xjSG1W9uyOKjIRvhYHzic5+JNA12Ag+7Czdsik0UgEG0WpNk8+xNAlcbFIP
         wCFrlnMi8EMCJo5+UnXwFlMBz3X1pCCSTZLlSfvwKNQ98fzhhTAbpCR724dNTjHXhbXN
         su8ORiqR1L/EGE7hgqcDAY0jakAoUfWPfg0fdNjnU4pzwDER7p54LV4yAIK2pqVdKQAc
         maLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768319910; x=1768924710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIUohOSEadvIpJ/WOpqMNMkzcciSx3DWJXtqCnl3QmM=;
        b=U5B8weMlUV1aVMB7uRgP9HRMtXF9ubHNP7t9Oec3scDYILeeKKRwpjCUl+UiBxfQCt
         E/fUBegu6rRrEgrXIKLg9Toei3wBL4EOOl7KyqtrNSjAfehiBBrOtahwdsrBHXApBYNt
         mXFdSqfPWOiFZUoaEp10hyaG71YHTE38xtdz2rq07tZX9qd1KWvYUgs35QJ7PNUbULcO
         86jxX79P8jvDBtUnX/sqML5iggybwtoO3mSq9X43S9u4aY/dh8PdIf8WTw4crClGxXCK
         sJId2KURATkT4I8qZ2svt+OLS0PJpDlF4zy07b+gkANCUzgpcPwqEEb0uf07SYglk0j4
         dwyg==
X-Forwarded-Encrypted: i=1; AJvYcCVMUkNfZwFnZmmkCFiKYF5IgB4XsPhxxq0v0iri7Re/+FBQFOnElK4meq/a6x3CYOBRfjMXASCCxW+FUKZmzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf2lTtKW5iNExMkO2igGPIeU/GA57Pis+MJy2ATf1tABertOI/
	1Wcdr932Km/DWp+gVIqy9n8Uwwx4SI9nX7G9z51YY+vQFovjqCLHd7uvFD3Sd4T19f2p6qRQL4m
	QNtJNG8qFxawGj1IUzD1sM3DenAJDprCQZYPO9BBRCDXN3UjrIfYQJ0DrUxcjQYQn9gGfXg==
X-Gm-Gg: AY/fxX7E5rKS52OmMHgk7Czaf165ao2y93LYm58E55275XbbhQd5VgI4yC9nOuTU6/s
	2zexaJPy3Z+H1uofUEyqx81ps7n35qwhNFhgdXr882Wnn9IZixEh2unwwcqw/pQWh+tL6yUXJST
	XqO+02x5vrkEWlkO6GjrX/26ISp2dUV2cFLF/t3yNExashdsBVWnjhyoOejlHoZQoqc5cDVbB32
	Bdp+keUMlwWamoarEU1CRsWNvIhBq1KQyeUpZQgdF9lGeHAm/p7WD1NlmSmq12sQAZZDkNmvhzT
	39PDWu7XdRTUsQoPg91u9WGWlF4tuiY/kXZ34AU1AWIGV5fo08cEuz4sL3f/dU55muJrWVNHLmp
	cvEcpJPn5O038YhBkwlZubVcvcQ3Q4NNmHypR
X-Received: by 2002:a17:903:2f92:b0:2a0:8be7:e3db with SMTP id d9443c01a7336-2a3ee42890dmr201479785ad.15.1768319909625;
        Tue, 13 Jan 2026 07:58:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQZddbYx59WFgJ213od7FxJXsg/ppc6HXu9KmcADLaCc2D2xMt3lSu3DkV6boUq1l1ym3MwQ==
X-Received: by 2002:a17:903:2f92:b0:2a0:8be7:e3db with SMTP id d9443c01a7336-2a3ee42890dmr201479445ad.15.1768319908995;
        Tue, 13 Jan 2026 07:58:28 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bcdsm202738295ad.101.2026.01.13.07.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:58:28 -0800 (PST)
Date: Tue, 13 Jan 2026 21:28:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        hrishabh.rajput@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <20260113155821.7iesxxuf74ncr7ue@hu-mojha-hyd.qualcomm.com>
References: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me>
 <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com>
 <ABmlNqg6uJXJLkDZo3uaZLdrTCFIjRXOJ68Hrx1MnHHYMnPJ9_g7GW0HGRhZBKv4--_PANfXgTV7h-n7HFC51zKNW6JkmEhpB6_EhFQ27Rw=@pm.me>
 <ee448445-8a6e-40ea-9464-1c2ae52b84cd@oss.qualcomm.com>
 <pquvJnlBgedyrF5RUTrHBUoqCIR7sQMWjwvcpm-5MuqAOxcbLg7i4H2RkuI27usOGZO000h3c90TM_kr6c5UFfViPCzGXX5MNWKFHugevXE=@pm.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pquvJnlBgedyrF5RUTrHBUoqCIR7sQMWjwvcpm-5MuqAOxcbLg7i4H2RkuI27usOGZO000h3c90TM_kr6c5UFfViPCzGXX5MNWKFHugevXE=@pm.me>
X-Proofpoint-GUID: W0yWlyuMektAcJ-ERPFLTdT8Nx5nzETH
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=69666ba7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=k3Xfc6bkAAAA:8 a=EUspDBNiAAAA:8
 a=Jw3FZ3kOnBb64phZBNUA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=vs4QOAmQMkZ3NkxV1SYa:22
X-Proofpoint-ORIG-GUID: W0yWlyuMektAcJ-ERPFLTdT8Nx5nzETH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEzMiBTYWx0ZWRfXwAjjSMQ6lT11
 GGWAAZqDBrSWX377TOIlc9vu4M5lJt+hsB2+XykSBMlHTNF5OQM2ljaA6LKzgzaC179TbiutD4j
 +z61HbkLNTRGb1xt3YG5o4y4lIo8kh4aVUMHo4QJect3X5J7mQmSFgUgrmmOD10lb4phNY/jvr4
 hdcU1a+tX8d4YMNeUVvRrVHMxWhqJnTNw3yrAlMGuhnvJ4cVqMQ7otBY8rDVLIYx7YwZWmb6/pj
 /8RTQqKWLa4ObpPhgR8aXcl2dTgSxqwpKv6pZAswfb3ZCWixyvtRu6iMgP54UqMx+r6CEu0NmgA
 4GUsMeVMwrIyVg5LNU6NFbB6iKO1+8HQvq3pwt/sxlGvTx87u0Q90QeegeHYIXElAbUtHLTbotQ
 BQAmcQezfZcIf0EQFQ4WmoLvTpaTLCfIRfvnLJiKaaw2f2WW4hQa7j7a+DJ+PVXV76MGdg+nSRL
 qGgfKeZANmABpJToGMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130132

On Tue, Jan 13, 2026 at 03:07:20PM +0000, Alexander Koskovich wrote:
> On Tuesday, January 13th, 2026 at 9:50 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
> > What I had in mind is that with the sources you can track down where
> > the issue comes from with a fair degree of confidence.. if that's a
> > Fairphone-specific issue, maybe you could prettyplease ask these folks
> > for a BL update somewhere down the line
> > 
> > If you still come to a conclusion that the hyp is wrong, we can accept
> > that workaround..
> 
> To clarify the device I'm seeing the issue on is the Nothing Phone 3a which is another milos device.
> 
> Not sure if this affects the FP6 as well but issue was also seen on an 8550 platform, so seems to have the potential to affect anything 8550+ at least:
> https://gitlab.incom.co/cm-ayn/android_kernel_ayn_kernel/-/commit/7ae6565108654991aaac9b73a2221509511e59d3
> 
> It's not that I think hyp is wrong, what I'm guessing is it's a bug in bootloader exposed by a change in hyp dtb (since it doesn't affect blair on same abl tag). If that's the case is it still acceptable to workaround?

Are you trying to modify hyp dtb here ? how ?

blair is very old SoC and may not be running with Gunyah at all.

> 
> For the majority of devices on the market you can't really update bootloader, it's signed by the OEM and sending a support ticket about it probably won't go anywhere since it doesn't affect downstream (since it has the label).
> 
> Thanks,
> Alex

-- 
-Mukesh Ojha

