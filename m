Return-Path: <linux-watchdog+bounces-3417-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F05AA746E
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 16:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A47DF9E24FA
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 14:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454E3255F5C;
	Fri,  2 May 2025 14:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrKit6BS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E30255F45
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 14:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194629; cv=none; b=tRs6Qbn384Oto+fl+ocI4JMAPfl7pKyQAPpPCKhysSdVbB/IHkHfkJB8Q7IvfF9+3ihZ4oPdBVmPDK6d/HBvwNo01nqiV4vNEJH04xyzZGd0lXM7cr7Rpql/itjm60M18Xq/QXkYPTAfu6WdWxgJOEhHB69Jj6TlPvxMotz6mog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194629; c=relaxed/simple;
	bh=LgutJA0lJhombQJ4lvFFMTu6PtaO4DwdRtdemX7aeNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=un3feqF2grFY2tJHYbyKtGzSPnl64Bqse5aFEoKXI1YKHIHRlOiHBFje/Td4KQvckI8Ayn5pvLJjh0vYlshp9AXgA4LWb7jW84VSCqY7N5SsgF2wBrj05X5lYJvR18Y/aOFXGoNig2HwQK23d0g3/L3S9l9nPNM7Thz7ReL+Ogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrKit6BS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DePrn015020
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 14:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oyxo2SQbtPaQHibZb3IFvrcK2jBkjO/BXe2BArjhyn8=; b=LrKit6BSeqeNAM5x
	WqIgVeTVuQ2LaFnqwkgUpSW4qdyMZtvJ4L1EK4JBuf9iyUDpomGEfJwNNiXXMMUo
	TC9KL5JiwkfH5qMOXd2pJlNquscGbzLXy7GETkDwhNpbuES6Y7KhOZg18xOieepq
	URcUejLWwQbyhFwGkKk5v6TmihrdapI5KeCE84MI15ddUIa2WqMXKhziJ3XDO0MO
	qP/YnYCRITFrRl1BuYFcy91QiXf4sMhcz3+FKVpz6hIMDR+f0HN2asCqGwgwDkeW
	H1lll5AWPIni7i+e2MnPzfjBd+iklld8B1SymwqHo4DV/5E0GUjUm7tyy2qs7fC8
	sVJCcw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub0e34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 14:03:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so8432506d6.0
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 07:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746194625; x=1746799425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oyxo2SQbtPaQHibZb3IFvrcK2jBkjO/BXe2BArjhyn8=;
        b=g5PbBu9Nts0s87YOIZBGg/UVcbBCsONhxPjkyt+EwWvbedlXBqgda2/inV2H2lNTOz
         nhbvmYjlwPFoFd9kEV11v8Gi0xRg+SmHF5KB2YPXDah9786F3DIE+pVU+8pZzezVzuOe
         sgoBf2tXVbPLo9FYPGLzCxCExST8FEs2CcDp3eHNpoVx/tCEK8cHIJWtwPQGy3v3BjhO
         ByklRJSzlNLTdxi8vefsFd9zpgQTH3JOUHlQckbrcV006eYZbr4tAA6utwpqWmSP5jdx
         raM9/0h9B1Jo/uyEjiBUEyNxeOxMOF/w6ORXT16HGi8wWxB/Ntn3X8e80QMaXQwjuWYf
         Mg6A==
X-Forwarded-Encrypted: i=1; AJvYcCX5mv9uCjQdfwJ0AgCwBBNSyqhGeidGO+yKf2p8yTKoCtWTL42OJJzazAdwouFT6m3XDVpwYKZ15vgTtMfL8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/VOHYyAaFr49xhRZa+QDgSy0/U4SBxaui7iGQbB9w5ucfGhF0
	WGohW/hWQizvCFQvoyQONj0gvWPuM8uzEKJlPei+mnOaIUIH48HCstpHmsvJ9FeGslIGf6PfKwG
	/Y9zh2ckpbTCO/BUOdsaC0p9zZ/Uux/rmPPIetC0c5SIaE9zwtOqmXKKQ7L6/Lct+dQ==
X-Gm-Gg: ASbGncvWcb/tQ8EDRm5S4eGR9KyFsrPiaEAXswvR5lQ+Sb48fD+QQm3YW3BfkXYbzbx
	TziOxZMD9Hi3ryU3b2Ql/u4pxoyh9r7Nm0BiWVWVc73WiT/+57gUjk1/GdZ8NxWUwPPA4HwrxC0
	wbYwJg7m6ShsVVEr3swaTH6h+qrBDQ65En4rLei5SweyOAj+8pSBU7jnqb+JUQEzrN1LbOMJ878
	1kP0lKmILI5u5ucuSaM69sztMZC3Y8sxRxZCSbpo1iFq9X7vJE1qa4zUX4HHVRAWBK4Y0VzXrTH
	O9odC/CNVy4ECMFKGSixWDKhzv+9x5J1mEUQJZqUvQo6Xx59Xp2NrOpIADr0v86g0BY=
X-Received: by 2002:a05:620a:24ce:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cad5b618bamr159159985a.7.1746194625486;
        Fri, 02 May 2025 07:03:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAZdoEcF4muK2lzyA+04Q12B61EG9ZfRedb/HviJ5YwpupYBOF8I/+YmpnDf2FCTkGY1aqPQ==
X-Received: by 2002:a05:620a:24ce:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cad5b618bamr159156885a.7.1746194624883;
        Fri, 02 May 2025 07:03:44 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0284sm53569066b.120.2025.05.02.07.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 07:03:44 -0700 (PDT)
Message-ID: <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
Date: Fri, 2 May 2025 16:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uL9VhQmjQv3AlvPWnKxpOHwiWcOGazOC
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6814d0c2 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=nDYdJfLhOtoYANEz9-kA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: uL9VhQmjQv3AlvPWnKxpOHwiWcOGazOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExMSBTYWx0ZWRfXxiscYtHrRGTD urTmSzMsjUaXAX0S/Fte6m2l48enTgHRI//ySXXiyIPmZ/bMp0nyGLOVa3YZlcWDD4jeMxWxFE0 p9aqzdOdqZBNQ3cwKhU3iaeAbCcbOoo9+BsXzmNGLdVLrSUM1CW9U/4MUen8IjIfhnXc17NjjeQ
 gSWmx9BGVierQQCmfTVddtinP0km7EEaWu/yrzpqzctObNIl69JrQbb5T7KtwdDo5qeTI0fHnC+ WECorByvmUwOkKI7OBSe9LB9N+kRa+3mDOZcCuQ+ciSCHbJAHzNbRZoW9Ug2wwazaXTMEbVeZ4d oMdyIjjJommJoQudjZ7RIdeFDWXqhrKJPCur9FdG2KkCeY/TdZuAFGfGuLHYaqBedILWPLM0lQR
 YOinVgLNBaIw8gm5N7jwtSolqCjskKQEEIfsgQhLxFs6zgjOyYWSk9S4eBtijV+iC8rOahpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020111

On 5/2/25 3:17 PM, Kathiravan Thirumoorthy wrote:
> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
> in the WDT_STS register is cleared. To identify if the system was
> restarted due to WDT expiry, XBL update the information in the IMEM region.
> Update the driver to read the restart reason from IMEM and populate the
> bootstatus accordingly.
> 
> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
> as below:
> 
> cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
> 32
> 
> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
> function qcom_wdt_get_restart_reason() to read the restart reason from
> IMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
> +					const struct qcom_wdt_match_data *data)
> +{
> +	struct regmap *imem;
> +	unsigned int val;
> +	int ret;
> +
> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);

Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi

That way all platform specifics will live in the DT, requiring no
hardcode-y driver changes on similar platforms

Konrad

