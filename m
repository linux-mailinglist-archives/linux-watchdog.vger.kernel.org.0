Return-Path: <linux-watchdog+bounces-4987-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T4dKKgPunmmgXwQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4987-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 13:41:39 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A3B19780C
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 13:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01BA7301020B
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 12:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5ED392C5A;
	Wed, 25 Feb 2026 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4PoU5ea";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5oz3wzI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F09393DF7
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772023286; cv=none; b=XzCozM9CGPI5+6Pz/TEuclp5iaJwnx4xMWXZhgnIbY1olvutKi+YWDq66Wh3dHYVUs1SOfLGzng9Y+jFi509d1E7a1bBmFkJGd0jJjkp9vU5mU7BezlrZo03p1gQcxYoy8KErrtC6bMiXZf2Rq3dsK9MOPl2q+z5ngrEv1xncTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772023286; c=relaxed/simple;
	bh=iqvKLMDFqeno+jEiq0kO0YroAm03A6FEtNiHUdWPP1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9OL8MfFKvhN0WiH30DN+h2vKPMXpJKemGaeyDzY2NgTj0ZMCVj/s1rdmKGkeoa7oI3v6ucfbZTq7FBbO3AgJ77viRiXBLCZch5Psh3XwLfficmHT52sMhPI/TVizyYeRWDcKpCZ0BydpXZYH3rt1mXjOgFu3WwhHaoT7cvtGws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4PoU5ea; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5oz3wzI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3RfY1512055
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 12:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYT7mQ2ja/t6BbG4swbmeUHgbB2sHNob61Efta+Yx6I=; b=K4PoU5eaODjd5Erx
	y7ZESAXmdu8XRksHW6ZBHZfOYVnvnlYZvfWr8XU3iinrkrtwfNLzB3760EySj3W2
	F+PYFPdXFlDwvU6kp1lb2TnRUY9omAnLsjQbglYkqJS2FlBuXLlRT8ELJiwj2Ee6
	MBnrGps5sU374fb8i1xCKwawGSj+/jhUymuWBj9XFb2hdkSFRwFxKB7mMiRDDUAq
	YKQ/5F7MOGl+oY0OiXJKyx11OxUSFi+NGVoTaWcEWYOumLsqfNU1bJFouLSZiWmb
	YfnTdELai8uFkc0uUmuwEynyHm2NKmTYJhe0RPvz1MsbhZP6F81uXQO4kDNSoLaV
	22AOGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf07qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 12:41:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70c91c8b0so594890885a.2
        for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 04:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772023282; x=1772628082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYT7mQ2ja/t6BbG4swbmeUHgbB2sHNob61Efta+Yx6I=;
        b=h5oz3wzIMSymH/W9QUPMpdjXybvXBI8ivdCJgfvKDuucG/Vzx6raJtil8FjyaeGhkj
         8PLrxJ4WK/GV4ftq3B95T6dngxiJnk/6lq5lyJULdL6xhYIEUtUdMdd9mAe/X3Cnzx9K
         KVIzxOtWn/B0xQk+mFMSWExCZdOw0Z2PLeN6Vb9iETCV3aIvS5I9qzxUDVQ6+kNtDWXc
         uMCWH3jfHMfjuADDKTDHwSG16+KoCp6O9HQU1TQaV34YdOvtUqV3tURvbsmNqqShuxjF
         La81UAug3An8pl1j/IWBr1lXVt44zQo8J9IEH48IcMEFZE5tcqwHOMqMjvCS9ba/nuLj
         3icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772023282; x=1772628082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYT7mQ2ja/t6BbG4swbmeUHgbB2sHNob61Efta+Yx6I=;
        b=ZVKC6h5t9bXQ7XRDpuUeB6Op4LLKveeDEAhSW/jW+/eayJ0PWyYNurHt2tp6dxmAXx
         MbHJmUBs0OkiC1dHxUsFJspaJmgpbB5UcoPW3uDZpEiQioyUcF6MPcqQ3W1LPrrkF5cc
         MCgxUmhzkN7JIxZ87oZfmTU/i8xY2b5mp5p/NxjlCarcnYOFHmOdl1gJK+pNJ1aMysFa
         Kjo8281HyPTEbQf7yPg+G57f3TU6HdySJlsz0kbc3Wbj1ipWol11FtNki3vruhZqF4/g
         X3/NHxqTBKLh7KEDOj2Fr1ZuvZtCj2UrRExKVZzawiJwzG28Mzt/MmZwGV7BxyHzRoqJ
         2EAg==
X-Forwarded-Encrypted: i=1; AJvYcCWoAwPF0GdLoqdlz5CBBAYQLpM6PvD+xzNisl4FxR4gMtDAiHxHGpKPFph2VffLTxWncDDZi1NqXyxoKTC2MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbklJnzpFf9rF3IFCnUUnfzX/m+TpX00+n48bbHQ+h9p0RoToc
	vV8Hp0uBuVNR+gpAhfHiS/tOLTMxYrPpaSH6kpUZ3vRvkPqsXjqbm92syOAFrFmBPj31wVCnvm1
	9urGSOl1j81n6RL/inJAMoBqhoB7+UoKLql9AyIau+oRwdeq7G86K9/3iN0YmneSaKF9rKw==
X-Gm-Gg: ATEYQzwDq11z7IrxLctX4yCaCHJ1Pk5UerxIJafKMesHG/Q+9VjmM3eSXMLsf9abivu
	vtiFGUb1Q/YQEc1KZOHVbc2HNf9Ltw7WN11JaUpR79JblxePVuhT3IXsL25Zy6clD8BGUrWtw4O
	DTrn782s9yXw5mYROczlWTjSQZ1Lyhc4T35ZFAqRw8DhXRZqjo880/1H+bUsIr7XcelX44y+TnN
	t5+cgtDm36Y6bY3u/9VHBiXhQi1V11A0qSs9FOrz3zeMHmSEYsW5DqopDdqRHRqoYnEeXxDDOAc
	i1OVT+slYF8Kbq/GEBE5YP8/yDOLA5IsxsXXquthsmKKnnB6ZJcVlPQCvetKI7OFR6X5Ff3q32W
	CObHa6CHz6Ds3kIysUDVNQN6Cbhk4sTqKsC0mUUgBt1YWRyp3KNwX9/LAu4Lqmv5XZ1p04Gcii+
	/0paE=
X-Received: by 2002:a05:620a:1a25:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb8caa40f8mr1516386785a.9.1772023282391;
        Wed, 25 Feb 2026 04:41:22 -0800 (PST)
X-Received: by 2002:a05:620a:1a25:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb8caa40f8mr1516383885a.9.1772023281901;
        Wed, 25 Feb 2026 04:41:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f191b9sm500484366b.67.2026.02.25.04.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:41:21 -0800 (PST)
Message-ID: <1a28d203-e0ee-4c0d-a6ac-7f50ab26bdeb@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:41:18 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
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
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
 <20260225-wdt_reset_reason-v7-4-65d5b7e3e1eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-wdt_reset_reason-v7-4-65d5b7e3e1eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VZppvJWN_P-JoTgB1zKDDlCJeaksqXN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyMyBTYWx0ZWRfX1DATdd7mcfeV
 IEnAEDeAWEEef2s7R9Z5k8NtBP57hh0XrkWgsy4iKFGUi0diruXrkuIbZtWdh1eAyLziJNsNVXV
 tsHVXEcn47rZwbuvkwPt4ApPHyK98ifz9tLG3z/uSGCNZniRipC7+XYzg8rLhrJo/yOMQP5MTPJ
 LHoMiF3kbpem3OG70kD5JKo+V4tJdmdM6ZcbwvwSQ0/Z2sym/zTNlYZoy+fPltWq+SsmfJvxuwP
 AID4BL374LBiyJ9wcG9ZWtj9tDGIiURlPLrFcLQpvviYq25eHGrc19Nwcjv+BWBP4BOOUMph0uP
 tYseY0SEXFapm9rYetPdXB3L5Gf10BUXCLI7ZMPi4nzq/itfilYN5c0139xIkbwtmtIfzeEMAES
 EfByB0JyTxhNahvQGq5UlYYS6XmzwH+tuA2s0lhO1/sXKePONF7hHy3Rc6b4QKYFDeaEn1F44sz
 QvQ3XFVeDUt03fJuAIQ==
X-Proofpoint-GUID: VZppvJWN_P-JoTgB1zKDDlCJeaksqXN4
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=699eedf3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5uP7x7crlKMPZidxuXQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4987-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03A3B19780C
X-Rspamd-Action: no action

On 2/25/26 7:43 AM, Kathiravan Thirumoorthy wrote:
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
> function qcom_wdt_get_bootstatus() to read the restart reason from
> IMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

> +static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
> +				   u32 val)
> +{
> +	struct device_node *imem;
> +	struct resource res;
> +	void __iomem *addr;
> +	int ret;
> +
> +	imem = of_parse_phandle(dev->of_node, "sram", 0);
> +	if (!imem) {
> +
> +		/* Fallback to the existing check */

Odd \n above

'existing' is imprecise, perhaps something like 

/* Read the EXPIRED_STATUS bit as a fallback */

lg otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

