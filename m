Return-Path: <linux-watchdog+bounces-4988-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePL3FXL4nmm+YAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4988-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 14:26:10 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C43BB19806B
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 14:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8FE4303A3FA
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 13:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48023B8D40;
	Wed, 25 Feb 2026 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FlNLDDHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJGou4v4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C8395DA1
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772025950; cv=none; b=d2nGfVCBeBp5R9UKjlpNMc+ceC8LG3eexA24PwvGRYkluKBvobzmi3GOeDvuECPdZVwg/N+2/BbbX7N18Hg3Eg5wY83gUnsVk09MNnrgpUZoasoA5oB/jVAlnMRztxtZ88CpEHmwCf+O7QE2NP3rqSda/JZSIlgXJele5zGYAcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772025950; c=relaxed/simple;
	bh=QBnGQRhjPCgFqzWG1srroUfv1xQs2zaYDV82nxKh1sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3vnsWZoXPvakv4TElA9VTmkNYiRkjcMTOCpNQoSVVmx397MvRIW4RP8u799Bq79OWuo5iFgxZDVUaz0bqmxXTKS+gEypJTsuL4STwAjujAtOmEc14X/+8XdoLJs6W765AS35bmG70Jm5GcLaddhiD/yLibn1AP4e0Ff8ukKAeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FlNLDDHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJGou4v4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SsZV2127731
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 13:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dl070totApNxtzNfs2Ht2ITbl3V+CGxeE7SKwvt2uYU=; b=FlNLDDHMuGJUk4NU
	cPrhaHevuB3AZSH6Oweq10Ppn/ZaskuaGRetf0Ml0q9GlCgixCNfh/OzXuzJZSKI
	rOyeFuRozAzmI6ly4cBa6s0tQV3zFd5mqrCBZMl4hGXoomVY38crIlSYniPfFjTj
	XL4/VZWRqKcNOUne9yBSlBS2A18P+bFODs3/3zn1yqjtvUQ2tv3BZqo3zZPAGJed
	xjv4dx7ht6ssRxE3KLuwukH6IpULQA7EoACaXDw0EQZ+x6F1QEkr2z6pB+FAbBQw
	qqJJyI+1nMYVUZOYEMcUgEJpxIXT0pepvwnQoTVSvkkmhtIpNElzGwKN4ZzeATt7
	D+Bj1w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chexekkpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 13:25:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8249e91bcfbso2569708b3a.3
        for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 05:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772025948; x=1772630748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dl070totApNxtzNfs2Ht2ITbl3V+CGxeE7SKwvt2uYU=;
        b=SJGou4v4v3/9YvGlbpGbjFsKc3CYRj2hDaN8QtQgUG0bwAxWm38EzESg5P8qNtj9RT
         sMZsM0FAZSh0VUbfamwQ45hHgwfKBKcpeXJOqXc8Lr6Ydqnw4Upz6lcDcqgGwuuaJTI5
         mv9LpDmHGZEXbCF1Me9oGFM5288zzULsOBZNgpTARZgP5purZor6z9WB5yMwoGobDMsG
         eXY3qCSdcbEGewdirsdxufWQVoNSE0tE1Gc3h0Jsjxu0Jmnsyfu+Hi62cpiBi/Jh0Ui4
         grQdSFahha5+LPqI3uzRfOiBNiRBY/V466q6C2ZO1YnfcJpEP5tjzyHsdl65YUucaeXe
         E+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772025948; x=1772630748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dl070totApNxtzNfs2Ht2ITbl3V+CGxeE7SKwvt2uYU=;
        b=HDiOQcEZ5mMH0u1b5AXA28w+eYiWunH82TJFCPsf89xv7TCr8J0txtUabSA+31v0EP
         CqeJBENHdVhp4C5pGLiZA8CLwJTTfc80ywzlvJ1aDgpy/mh4IrKi+ORRTKhERjuJz8a9
         1WDF3OVNDpmdMCgirqRvuRLJSJNhDhXOtUXcjAP44nigZ06cDEnOyeK7aRJOnEj7dDoV
         Cu9NXspU85RZrfqWoRqlC9IdJEAD0v3hsoQhu9c3Eoz57+3AwIC7hiX26cCLHSEIaTEB
         9u8Ax27zN6jp4G4EgDAx2IXSfUsslRlziu2LFFrSxZaed9sfXYjGBGE5ZUX9wDU0grdb
         X03w==
X-Forwarded-Encrypted: i=1; AJvYcCUHC1E7vdea9Eu1O869OsJ8Bf8bxKdfHiK6IXz3u4+C7SspXA3p7w9w3RkhPz5lXJwWICspcWkiFXAXJkm+vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8sSwg+lkMCxE6efEGeRR/BML+hLCRGoEjg7j9+yqI+01lyYuX
	/o1+91s/DpP7Gxd0FORiCa209ZUjoYUm1ixhiukN/piprID1dNs9MYxS8FrLci+5yvQnK/Vsk03
	m/CLc8btoXlHAgbfRIc42E5fioPlb5fNNXx8sMeYwMfj4DvCW5L4k+1N4aI07a67dAdj44Q==
X-Gm-Gg: ATEYQzzhsMwy+Paua2vOLC7Av1e8w9qiTz+InDid6gnfG8FK5Y0RsuCBqckEjZiYSPA
	z685NXYOUHnrxq/7b3HndeTo5PprKgJL2sW/tt0I6/C3jzklhz/3sNxLp9KuPUf0V5BJdznbpMg
	NpPBPQ+MZvjosgNxbve3hZOOAUVDC99ZFIDZUq8TV7dPwZ/JIUgnt00+rpP8YqQnZBxmZKucMF8
	0ibWdzXnb2kD+FcIuLatU0lAXem5eit6TLNzDINu1zLBqjRWVgK5K9OVN4CkSDka+jC54vjTD42
	TL1DbMFOqNJAIHvBGpchpt/IHaKIZhtS0YnZ+M8q19vbOM6j2x+ZVyLplPFM0gOHCSvMKYBFD1r
	J+Drw7DwzlGSLlSSVOoaaPzmtv7UfA7ISoQTOIpN/F9CSICx06Vq6l0cFF6Hcs6l3
X-Received: by 2002:a05:6a00:885:b0:81f:477d:58db with SMTP id d2e1a72fcca58-826daa0cddfmr16888229b3a.39.1772025947516;
        Wed, 25 Feb 2026 05:25:47 -0800 (PST)
X-Received: by 2002:a05:6a00:885:b0:81f:477d:58db with SMTP id d2e1a72fcca58-826daa0cddfmr16888200b3a.39.1772025946950;
        Wed, 25 Feb 2026 05:25:46 -0800 (PST)
Received: from [192.168.1.7] ([122.164.81.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8a1145sm13438814b3a.45.2026.02.25.05.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 05:25:46 -0800 (PST)
Message-ID: <b41d4998-5f7d-4d89-af80-a7a2d2a03021@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 18:55:40 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <1a28d203-e0ee-4c0d-a6ac-7f50ab26bdeb@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <1a28d203-e0ee-4c0d-a6ac-7f50ab26bdeb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyOSBTYWx0ZWRfX26xRnWSr0pK2
 zof7Wv1kgm7DAFQl56ppH+/obf4hk6GjnbO0l16CAnMUK0xdxqpUK8eNTf5XTWMaQOCZkDTkQIs
 CKRLRrzsBW+noluhKpaVv0aWtawitzUsC7RkkNy9l651kfjaFkSP9gIs3M3RwUjfq7G5YFRnzBk
 jP4kXpWMuglNMVnUKVZjNCSRheVvk3msrK9pg7RWg3lqGIJSYtCAeIxxCjpKyHKFN+L3Ie4mEFm
 6RosJj09YDiIDv+zj1+5tHqjhR84NF5a+CZ5VYhzI2oVhY9pahuFAzGMIfkJIEFJgj69fms/Ojd
 NgsgRrXzWtlIMQU+nUIx5aFzzKby/59q8QP5FpoOZPsmXIqHk2nJzN0Y0zbNbbuHh6h7YAeYPz4
 kM8BJBIGw84pHQjOG0Om2VXjWS352Q7rjpMWhT4wPfJlgHEzmORc6E1qZ/6juhIFVW4PVAK86Xm
 mvNeOC9IzEp2iM9j3ig==
X-Authority-Analysis: v=2.4 cv=V85wEOni c=1 sm=1 tr=0 ts=699ef85c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=mNPf3JdYh40LbGEelsvk6A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wjWkyli7g8A6NY-DO1gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 00okW-qHvZzmk4Rdg_1-6DGe3j4yqWom
X-Proofpoint-ORIG-GUID: 00okW-qHvZzmk4Rdg_1-6DGe3j4yqWom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4988-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C43BB19806B
X-Rspamd-Action: no action


On 2/25/2026 6:11 PM, Konrad Dybcio wrote:
> On 2/25/26 7:43 AM, Kathiravan Thirumoorthy wrote:
>> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
>> in the WDT_STS register is cleared. To identify if the system was
>> restarted due to WDT expiry, XBL update the information in the IMEM region.
>> Update the driver to read the restart reason from IMEM and populate the
>> bootstatus accordingly.
>>
>> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
>> as below:
>>
>> cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
>> 32
>>
>> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
>> function qcom_wdt_get_bootstatus() to read the restart reason from
>> IMEM.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>> +static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
>> +				   u32 val)
>> +{
>> +	struct device_node *imem;
>> +	struct resource res;
>> +	void __iomem *addr;
>> +	int ret;
>> +
>> +	imem = of_parse_phandle(dev->of_node, "sram", 0);
>> +	if (!imem) {
>> +
>> +		/* Fallback to the existing check */
> Odd \n above
>
> 'existing' is imprecise, perhaps something like
>
> /* Read the EXPIRED_STATUS bit as a fallback */

Thanks, will update the comment as above in next spin.

>
> lg otherwise
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

