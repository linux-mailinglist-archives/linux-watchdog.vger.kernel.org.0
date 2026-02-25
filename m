Return-Path: <linux-watchdog+bounces-4985-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG14DMrsnmk/XwQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4985-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 13:36:26 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C40197748
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 13:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 025623032D67
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 12:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7045A3B8BA3;
	Wed, 25 Feb 2026 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbBjsu3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdA/pjHk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8D53B5318
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022861; cv=none; b=AJbDFnrhhQm5kVpUjwN7wSZ93Sp4mmP7mSTGdsqmPGlpdwNYYsT2Bdtt57KkAopZ56MrlGw0WarsfwLQcFKBdSp2DupHCfj9co4xJRutp1vN52UTBwMHoVonDoUbdsF/IBsNdBbfLcSZDImzWDS5QURXdxEKwpMRx5VTTn3ZCu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022861; c=relaxed/simple;
	bh=dvoS4cXOTQ6nH4o6gAkqkV4CXoHhaBdJ7jRS1GiLPus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ra2l8zjhdkG8yb+Owed/Of378ziMhfKLvLR+HbjE1GwcmI4oJ2O66foNrXLwUgqH9Gs+QzITwnPIs6lyK0aRgbADpt0RmwdepOABh1oYGRpkvOBwL8uwbrpIS9crkxADkjenowdx+SzYRj4J6HHBRcKx7m9QqbntI1h6HL1t4Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbBjsu3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdA/pjHk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SqtX229723
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 12:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPZMGiP8R0kvpmiPMpY3O0daM4uBFegj/GCC6ulAun0=; b=XbBjsu3VlELAPBJy
	5WmSwZLSKWaDUTt50TIC3y9+qvAjxR0L0pT+AGKy3UFq/kWZtsIl/yB6Psy0/g2Z
	kltcg5+VTljxfd8NhACpZUQcoZgRh024IfYt92qElU0hYf8QH4QVO1PQu1PHYxqx
	1IbnCwVSBfEYZtiqGSWeJDT6x/lOjNWqA3/kB6fpIfgCw3Ysije+hg7gshuWoQt1
	daLVZsLF+kPs+OybCtZgu+ss0dJRdpNgKnhwmwT4dLaLEBb1hUOZ901t6q7Yf/Vd
	lZmk9sx2YTZ+Jj9s7ldmMiJ0GlfyaaITIW16WuybWXiKxH4jiyFT2S5sW8SfcS3p
	ksXa2w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37u7a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 12:34:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899b4b45befso5461606d6.2
        for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 04:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772022856; x=1772627656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WPZMGiP8R0kvpmiPMpY3O0daM4uBFegj/GCC6ulAun0=;
        b=JdA/pjHkFkO9DyETbn10uuceSri8u6SqOaXkz/dzYu7fgKoeK2nRhhL6/Ch6I05mAY
         Of2sdrfewSoo0c3a78voiyDOBYMI/t1P/7LI2Lk14cTFiVk7n4kKhxXK9WJhHf9RhmN5
         7UekMxGh98gNVfMM2Gon1xM+yNG8oDTbSGPhB8ptbN8yIL9pD7hXce6gj2itj8ESIphT
         9piJg0dCvydVzuZeoMEEnL1fKXUNJqBNFLnO38giXPAkPqR7D5eOtDhELUIKF76wR62n
         V7DJ7BLu3SlQ2f8Z+HWk5Ww2SuTsxpjd459OEGTHQ4XnK5QDkWcdqP2yAJJKOD9x2oSa
         437A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772022856; x=1772627656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPZMGiP8R0kvpmiPMpY3O0daM4uBFegj/GCC6ulAun0=;
        b=PeDrhr2khfTRtGQ9vjWau+Rq44u6DKCrDsA6j6Ig3P1phw7ykD+BHv+nlL9Om6aWED
         pnLOMd1nPdZf0jd4LswW9esIJoikXejnAcUi1AKh+UMzwr+zBMIp45RT/yezj/p/IoyF
         zGk7VqtlG9aEk+IVJ3JsgqqqouF3a9TEizm0pkSZUUW1DdAUCy9G/6mL4vt3+dDHXCyH
         XlPHA4H8DGQ2TBo8RgM3OmGFfJlS4cj2O+ENTojkrpuv6jATqbvBRiaUptgnAoZ6I6ng
         5wXpYiJIrdNLgUYyNyzaIC8NAtXeEh82NxzM8CLBwCMIxPs8Z0T313aWAWkEori/rDO9
         Wv+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMhvJAV2LwT1DQ7PAWwkifxgsMJVMtPL1hUWkFTv9/v/lVVzA5NE5RqMUQmdYCi5xGwKDAOQDHDeyap/qshw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSL2muqK1tPelVpEK5EzJBT9K2J6bZhYSJs9Y2JIIn1mx8G8U6
	M84cwp3FjjAnZczqlZ0RA29xTzUzKmOMak5A14ol7aGMmXCmLumTpn4y0ed1ng9BlgCSNbUYx/U
	rerwz7DugVTzUtDd54OvzoGbM2pqH/r5JFKsOtEBJo1BHQWOL+h30OvOEvNkhrThl08ovgw==
X-Gm-Gg: ATEYQzxnXKasbUKgOu3x55zEibbAWXxgEmzw+aMxDIItDLj1D20WLmazJmlPfukkmTp
	rRLQ5hWTmJbGgYuSwk4JDjjfnQGTeTXYP87CjNvsrF14BLKWhEtZCXeM3otsnX3aCGLuw2M85a6
	n0+XlU1LniOm2BLor/LP//2nucWlsAZVBgnAYoGzyVmiQJsXIfXFqGQ81ozgvX5XLgWMqT89245
	LjXGHgcmDwTis8MeG+wfFiHPaq7xxA8l1peLQ1fcEDFoTpPfFAoUpIGcY9Az/3JhUaac8qcbvRP
	DSKxQQNwI3AAxSOwiUNZG1pc6hpBxeC24+ec8+emNE4zcmgteg0hxxLG75vhyvTi3RT/Leafov3
	1OEFV7t/xKoAxOI2MXKvzkoo6ZCq6n1Em/YVIPQEL3By6nSdF3mLH5jbFBUPq89RNGFlExY/vrV
	iiE1I=
X-Received: by 2002:a05:6214:8101:b0:899:5565:efac with SMTP id 6a1803df08f44-89979d59fb9mr152712546d6.3.1772022855748;
        Wed, 25 Feb 2026 04:34:15 -0800 (PST)
X-Received: by 2002:a05:6214:8101:b0:899:5565:efac with SMTP id 6a1803df08f44-89979d59fb9mr152712116d6.3.1772022855237;
        Wed, 25 Feb 2026 04:34:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c5c514sm515848566b.5.2026.02.25.04.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:34:14 -0800 (PST)
Message-ID: <0c8b3f2a-9aac-4b97-aa13-1507860d9c0b@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:34:11 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
 <20260225-wdt_reset_reason-v7-2-65d5b7e3e1eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-wdt_reset_reason-v7-2-65d5b7e3e1eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699eec48 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=owAxAYLDMf__z6yt7SIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyMiBTYWx0ZWRfX78o3/v5GL+x9
 LNKxM285eJH7ZACRAHEE2xR1K5EklH9bE902IGlybZwzd9p/uKJsjhPupQXxN4AT27uLqSreXnU
 rtjIaYakoJfmyj4r8T7QOA34TCOpVbCL8YHfst+tiLFUM71CwEtYTTvc94AA9SRUYHAWZaZkixC
 sIy2m/Xv3guk4EqUTABF38JTNIjKVY20z3LTvPUR+MvhWpOBUEyuX/ImF3/TtYnm4MQAym9Ot/w
 NvR7i+Li+Cy47qyJibcOzyIHAyUKwbzjjXpBO2lPhzywPs1kPJWpRcA+nwWcCEI+Nf96i0Qn+lx
 mbs3gNED9+HZUFSNeRkbj5LFAE+7Uon/ZNPffbwTkzPI7fAIYwDsRNiWpnRm7pmXiTwSsiMNJS7
 Zg3WdOujjz/ABS+Pwil1stqHZXMWZtTrpgdne4gdjXISClVZLGdzO/f5sPHFDba3slu3WkOAXOQ
 gpgtAScG3riexOfxewQ==
X-Proofpoint-ORIG-GUID: U6wRt6E7wCmanY2pvrIJi35ME9yAxZZj
X-Proofpoint-GUID: U6wRt6E7wCmanY2pvrIJi35ME9yAxZZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4985-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62C40197748
X-Rspamd-Action: no action

On 2/25/26 7:43 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 112KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

