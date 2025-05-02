Return-Path: <linux-watchdog+bounces-3421-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC30AA76A4
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 18:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82B973B74E4
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 16:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E642325D1F4;
	Fri,  2 May 2025 16:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5azY2Vr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F725CC79
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201773; cv=none; b=JEg59Qi/eAwhPpaYPhSMIErMvrGkBT/Cr+uVwVezgPAil8BKBvadMF+w11ugKnhixDtpfGYTMzx+rg2U6VBnpaFnF/ahAcj8L1osJvbogiS8tNcHb2+raXbveH2eu/bxdVeaNImn2zO6xp8ScyTKsRcLzM80eNb2D/ylbBKQjxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201773; c=relaxed/simple;
	bh=nt7pCl0xKFuZMbcsKuarhpz0f9X8gk1jA/yLJS6JUcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmxwGdQBBSoaEg9k5hXheG/TdsAGDY2TPbFcP3FEMHkuX/Stzvf5sI/c46kvifbjISbOyUdrm1I7kPT562JE0FsuM1w2dig6fa3iQjjxtGiNNoMOvNReGPcX6ewKyNVRsEI+eV7wpbFzqbaU6dxhlgrtOzPpRtJV5BbLRh9Yb90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5azY2Vr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DMGJB002503
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 16:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1frcGzb8hC2GYxGmVc0gjbhl3/lGMlADlvPYUqYXl2s=; b=B5azY2VrKcqp2fDH
	NNgpg0OO9B5W60hqqzqsEwm63kQBYjYPSdS+o7RSFap1rpNms/7emM4fRpIuqACG
	K1vA/G/mavbFcnsWm+vPe2fW387ntQCIKnwZ1yRkXphMgqInW3t0O0eLC+7Z9cy7
	uKzxSMRF1ZAkMvuN1mL4C35QTScS20khcdabXIHw0UvUduo3FvG21uk3ax2earkR
	kx+QaMoSQFt9hgrdSBCCit3G7kahqOKWSzW0Jyp4OIcvi68ssphPqPq5Rl5GHjyW
	UnZ5b/hW9YvmYn8I+NROs9bxTZZT7P1vYjsW8nEasQ2oFfCjC/SJxEy9V81CpAoc
	TGERRQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u78w2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 16:02:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af534e796baso1170676a12.3
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 09:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746201770; x=1746806570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1frcGzb8hC2GYxGmVc0gjbhl3/lGMlADlvPYUqYXl2s=;
        b=vj0VSY1qfqVbCWnHQ24pWof0o1+g7CNQeS//yyacQOUEyjHgeRe9np06a6X+336crG
         Zq8AlYyfbaovtU9J6uTliKPtb2EZ8SWJtgAJMMBYIP5xMrjZl20XUAezXN3ql0dD3Ttk
         R6pwOYjGP5PqEdSarMmT+dak5LZOpWcWr/uUimiKNhN+nS5yd+heXxdZTFWP5Bzwc9Ju
         OkxcWWKL8+FIqkNzm+PR/SmeKE2JudNG7jHNc0Bt3i08wN6IAvxn5L+qOIVkO+28DzMC
         tKjTuvJXMtokPCvYFSS1S+UePX44UbTd/KNN69kSbz4d2MVsgN07ScM9NvD/zqjJ5T2c
         phug==
X-Forwarded-Encrypted: i=1; AJvYcCX9p7efMWnqW+pwTG3Vvt5sSMAuz2G2mxV8LfLKoqlvYF3pl7Rbu8E1mI4tHOTIUnc0LZd8Ni5avhUjlxHRJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYTrGSP4vatVlP1fwrv5Rh2RFzFh7+Qyz3F9WqOCcE5YBCPRB0
	tlMg6KbuVc9jwilzXtBlsXdb9foc4AEZ796v9BgcPJINarjFhpoyM4SivDteO1Tezy9c88JhtAF
	DOTnyltUSDOnYb+4WBbqoExv4E7fA7DvidDJUUOXyzv7rnGK1PQg9UsL20S3Tx3LPFA==
X-Gm-Gg: ASbGnctOPKxOaUwZ8T35D47voxpKd8ZLzznv1m84RxfsIzfRdEuN+fEAtWFjjAeNnHC
	Gy9TtT0YoJm9CWJM2SdYZGcl+uIuHJ75RWh1w1AARLTcTndLKMu/16Z26J6/lmSd5BAu/tISVRz
	2m60KhS8FBSYfzfoQnGA8athfWmUZJUk9iZbJyXVX3fePEKnLtc3Gk1AeWndl/+nEekUlLhp+CM
	ZQb60VUBPtheR8MFlLuOPU6sdLwLY0+2UCLZDtn01aJUxgDTbvUv6fnRMkW3DHsGvkkS/sS+DwL
	zYb4mUx51zpEd3BWSMn3PkuNjt7vhTdIRIVm6QuPKFbDLd3QtCjn
X-Received: by 2002:a05:6a20:6f90:b0:1f5:95a7:8159 with SMTP id adf61e73a8af0-20cde952d6cmr4451420637.10.1746201770540;
        Fri, 02 May 2025 09:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+5DGedS7lQxaiS0zztOhBE3vSAm0Y8qu2C3qMH794u9G4iH73tZO1pQYXwyOinkWDLCtVwQ==
X-Received: by 2002:a05:6a20:6f90:b0:1f5:95a7:8159 with SMTP id adf61e73a8af0-20cde952d6cmr4451382637.10.1746201770057;
        Fri, 02 May 2025 09:02:50 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920e67sm952740a12.7.2025.05.02.09.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:02:49 -0700 (PDT)
Message-ID: <41f0eb29-931d-4aad-ab8a-1cc725e9d30a@oss.qualcomm.com>
Date: Fri, 2 May 2025 21:32:46 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <ac8837b8-3964-40ec-84a6-e25aa06dda39@kernel.org>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <ac8837b8-3964-40ec-84a6-e25aa06dda39@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEyNyBTYWx0ZWRfXzyBt1LpnnORE ZfswacoOMoJpoHYss0XZpyLdG+qCSVNU+FWusOI6ejoWLQJdEZEQ/Ttvl57m0xaWjMBGSWOGfVU 6gHTJlsF54Cts3ifzg9id/49kDNAOcSSRqAVlztATd4CkSo2DwkN6Y437uY4RLkL0xWjdkRcKvA
 fXxBIJiSMcC9FYRzhklnCZvxaPsK1Maj9w63B75uhX+Ehqrhh554y98uMsRG6DBLI2jaYAEMSRe uv16XLMIBJNR4mpcFdtUoflfZ0tLp6kKelLA4FCCqesYXAuB4YxK0iHUUHKf4tZhQM5R1uhBQyK gdEYmv3VJY9W/z8O7TG+5lpVg9qX5xPXx/HOj+txB1U/aNX2hin7JJEWrixO7XS4lvDV8dmd0Na
 goP5LBMpzsxLDWuqHUruZyZB2NZ4Oj22M9/7xKcoJFXNItDu5ZJlSWxwhHtr4eHLBMaCWI7v
X-Proofpoint-GUID: GBTM4eLlYbBzk4OMxNlv1X-K1H5OBZIm
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6814ecab cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KK8y6wEurEKhoEb90x8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: GBTM4eLlYbBzk4OMxNlv1X-K1H5OBZIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=933 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020127


On 5/2/2025 7:03 PM, Krzysztof Kozlowski wrote:
> On 02/05/2025 15:17, Kathiravan Thirumoorthy wrote:
>>   
>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>> +					const struct qcom_wdt_match_data *data)
>> +{
>> +	struct regmap *imem;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
> And how are you handling proper probe ordering? Use phandles and define
> this as an ABI.


Sure, I will follow the Konrad's suggestion.


> Best regards,
> Krzysztof

