Return-Path: <linux-watchdog+bounces-4194-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C1BB4441F
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 19:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDE2D3A4FFD
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 17:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512EC30AAAF;
	Thu,  4 Sep 2025 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONcRKtNu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773B3090E2
	for <linux-watchdog@vger.kernel.org>; Thu,  4 Sep 2025 17:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757005884; cv=none; b=hRjWa8PkUkJYDTTUyiAjE3hwtjsWw+hSp6hWIVEbbhrGh4QNyHaBibt+2xjXuZAvCNVVlQd1NiXrCHImXrDIIAY4W24ZRb/8BZ3LDu6WY3mxmQrnguePlT+aGa3hrXrzM2ofq3hbpw6skwHd0WmCX4EaT4Nlbo3En0q9ytCnQrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757005884; c=relaxed/simple;
	bh=lHk4L89lx+vb9XAx8OLCLmaMKvJ+eE2425QCj3EnWLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIRfzwyTIwl7QqjgoDEi0cvIl0VgDIAU6hvaI+TvanKg7tAOhT/Fkd5d/jgtkOQNnYxvh4ojEjbEnPkxCcHjRl4uurqSbH0h1mKl2dS4BYG2O/OSPFZG6kr0EZxAZozk70ihcaI4Ys1CVhHlLkEPl3qymKs9IXtNufuqYOU2zog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONcRKtNu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7Z4003768
	for <linux-watchdog@vger.kernel.org>; Thu, 4 Sep 2025 17:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wDCU2fhHxVtiMCpIPYX39LME
	rM14D+YlATAbax0P9Js=; b=ONcRKtNuZ2oAbf/t4vVU4TRGrRfPX0Mnb9hZS/ll
	rrhvITBJwDhuZ6NitDUYWG7XXmoAklNdYcaQGfIGiFy7pllLIheLBo8isYIgrTMs
	rKun4dQ/cscDt8a9v18Hqn3PH3UQL54uSDDomPArslsdylr5Uj7sODWrl3AjELSd
	h2uc0eqhiTBIDi/HnF8uXQz89L8Cbw5rKYVkT4dFXnvEOU+CN20SNA0eqa7gffSD
	h/GQZeGvozVKvBI8pZkF4L238fP7Y+IkidIFA7BQApCsF85fh3sq1KIl0+NYLDEG
	YbOCtFmWdPWTjL5URfper/1IL0IisOR0M97kVjXSd7g6cg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s8cb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 17:11:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24c99bd543aso19320385ad.3
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 10:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757005881; x=1757610681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDCU2fhHxVtiMCpIPYX39LMErM14D+YlATAbax0P9Js=;
        b=eUD0+VDhyUmf/nzw6o1LgcggDHyzbwb62zqlST5X+zZr+C404XUUeVYBEyTC3kwGLu
         WkAjBrLOal1Pt0NY3xUmSpNZ6OJsn0YRHcyxOriGTuLkdX55qtzPybQz3FhNfJmKxIL1
         Ghko5g4T19DC8KAJ8CVj/jElsiIdO5rZkCqSnGwx2TvlhTZPGrWf8dDCzlsQR7fc0wQq
         OTwlNknGrxrh0jD8+4WZkXxVZXHMrabOhkTMME7m82KT2ckP5DVyxGeokWO/l5UK3zmq
         St2xXx6nDvHEGtIR1EpCxlMaEJ4mB8RleAQXkfSFRRBGpHUokXw3MQUt1s2zAL/qpN4o
         2mEw==
X-Forwarded-Encrypted: i=1; AJvYcCXWgCteZgl1UUX9sPinkEdmqTinAITWNulf5EOtc+rQDZgsLMxdai3VAnExyt28EgEZuH8LXxOekkLikX3How==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjRYKn/2Kbjv6sfX1RQf9hmFzJIwl221i2yyjS0DM5eMhwLLY
	bUKyCXcXpW2l2bqxPGbL5O5D3nN6Y+UhLWuHem6C1Yf7DsW8X0w4cdDOsJktG/9S9XJQJrojBhe
	KgO5inLgTrYcpF3WBOw7/TGF9iWJbkExt7PM8F7Mzoz1oXaYQezA6mcjXpdKCI5YifUfeew==
X-Gm-Gg: ASbGnct7eQimAkYd+wZpie2jdwfOLjkwGDM+HRptTwOTpakEIr0s4IFj2B2+VrVVVVw
	GM1H4dI08KzBY5pCIui7aBiGqTePpwbsglZ+7V3/as/6rgOhiMV0g7lV7rB/OrDXlMyG5mjI0Ii
	Ync6QBNXaM/Ew4XDBZk7s1BxZVsu5HIqgl99FTDC4uZu7TCY7zmXxtcQ3IoKaB/GkyZFCd06Vgt
	wjpfijAYT1t9BD5so2ouDFsj2OBcO3NgSZtQSlvPQyJZMLIj5poRvtF2tVwp0c3jdQH3+KX/rAe
	bX6r8EyGwBFNSgErM/3ZlViaqQdBRronZuptKby5rUVX73kTV5MnX+SD7nrE2PD4oJ+It6622Q=
	=
X-Received: by 2002:a17:902:e891:b0:240:2145:e50b with SMTP id d9443c01a7336-24944a11d41mr292553835ad.11.1757005881169;
        Thu, 04 Sep 2025 10:11:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR6rm099haqAykbn2/wkHJFgapnLtEXxFqzMUuEYbzOiP4N1fZ9bm5JnyU23uYu19+R3iCuQ==
X-Received: by 2002:a17:902:e891:b0:240:2145:e50b with SMTP id d9443c01a7336-24944a11d41mr292553395ad.11.1757005880692;
        Thu, 04 Sep 2025 10:11:20 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b9be55c1esm1901637a91.9.2025.09.04.10.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 10:11:20 -0700 (PDT)
Date: Thu, 4 Sep 2025 22:41:14 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: hrishabh.rajput@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <eaa2bd28-ed98-456a-b374-3183e54123fa@quicinc.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250903-gunyah_watchdog-v1-2-3ae690530e4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-gunyah_watchdog-v1-2-3ae690530e4b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX7UCEoUQYY+BY
 ddztbwNAGTJDvsVOxkaToJ6hyDpK3UOPNfy2vnrS1Ssi0HDI748T8pqudp6ahjJuJSula03hiJb
 GnSzd/wny6zXSEcMuwWn35R5nil3b9I5uPQhKYayVA2MVrBs2CN2FxoRgguqKjGXotruhFPh0WE
 j3WYcUm9iSS93sOxb5FC1bv2DgFh5ACqd515qmikJiev/I8+Q7iubjcZhPW6oDcr91B0M8PkuP6
 XGDnJvAxagS7GGOQRYzI5mbr0nYEGVlVoKTFtGS8u6fntTkARoS8EptsY7Z3uE7zD6lwJbKAxo5
 o8EmQ6y6kmS4QVGxwYEBuixT+8+NnaAiT5ch0M9hjXDp4n3+tXVRpN1NUjzRmS1/YNuaOXTuKqs
 KQ7XVf/M
X-Proofpoint-GUID: 2HKM53waDilxlHsU5TfcEim0b6KmwbHU
X-Proofpoint-ORIG-GUID: 2HKM53waDilxlHsU5TfcEim0b6KmwbHU
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b9c83a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=jv4jVC-EIb5C-n9TUoQA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On Wed, Sep 03, 2025 at 07:34:00PM +0000, Hrishabh Rajput via B4 Relay wrote:
> +static int gunyah_wdt_call(unsigned long func_id, unsigned long arg1,
> +			   unsigned long arg2, struct arm_smccc_res *res)
> +{
> +	arm_smccc_1_1_smc(func_id, arg1, arg2, res);
> +	return gunyah_error_remap(res->a0);
> +}
> +
> +static int gunyah_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct arm_smccc_res res;
> +	unsigned int timeout_ms;
> +	unsigned int pretimeout_ms;
> +	int ret;
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
> +	if (ret)
> +		return ret;

When I ran a simple echo test, it failed here on SM8650 with -EINVAL. May be Gunyah
does not allow disabling watchdog when it is not enabled in the first
place. May be something you can check if this is a difference between
8750 vs 8650.

It also points out that your patch needs some prints upon error. Pls
check and update the patch accordingly.

> +
> +	timeout_ms = wdd->timeout * 1000;
> +	pretimeout_ms = wdd->pretimeout * 1000;
> +	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME,
> +			      pretimeout_ms, timeout_ms, &res);
> +	if (ret)
> +		return ret;
> +
> +	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
> +}

